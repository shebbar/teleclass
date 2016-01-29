class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
	before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :admin_user,     only: [:index, :edit, :update, :destroy]

  # GET /lessons
  # GET /lessons.json
  def index
    @lessons = Lesson.all
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
		@subject = @lesson.subject
  end

	# GET /validatelesson?pincode=123456&sub_id=1&les_id=1
	def validatelesson
		@subject = Subject.find_by(sub_id: params[:sub_id])
		unless @subject.blank?
			@lesson = Lesson.find_by(les_id: params[:les_id], subject_id: @subject.id)
#			@lesson = @subject.lessons.where(les_id: params[:les_id])
				unless @lesson.blank?
					@pin = Pin.where(pincode: params[:pincode]).first
					unless @pin.blank?
						@calls_count = Call.where(lesson_id: @lesson.id, pin_id: @pin.id).count
						if @calls_count < 3
							json_msg = ActiveSupport::JSON.encode({ status: "VALID", pin_id: @pin.id, les_id: @lesson.id, count: @calls_count })
						else
							json_msg = ActiveSupport::JSON.encode({ status: "LIMIT EXCEEDED", count: @calls_count })
						end
					else
						json_msg = ActiveSupport::JSON.encode({ status: "INVALID PIN" })
					end
				else
					json_msg = ActiveSupport::JSON.encode({ status: "LESSON INVALID" })
				end
		else
			json_msg = ActiveSupport::JSON.encode({ status: "SUBJECT INVALID" })
		end
		render json: json_msg	
	end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to @lesson, notice: 'Lesson was successfully created.' }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to @lesson, notice: 'Lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to lessons_url, notice: 'Lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:les_id, :name, :subject_id, :audio_file_id)
    end
end

class CompaniesController < ApplicationController
  before_filter :evaluation_attribute, :only => ['show']
  
  def index
    @search = Company.order(:name).search(params[:search])
    @companies = @search.page(params[:page]).per(params[:per])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @companies }
    end
  end

  # GET /companies/1
  # GET /companies/1.xml
  def show
    @company = Company.find(params[:id])
    @society_evaluations = @company.society_evaluations
                            .group(:company_id)
                            .select('company_id')
                            .select('SUM(CASE WHEN age=0 THEN 1 ELSE 0 END) as age1')
                            .select('SUM(CASE WHEN age=1 THEN 1 ELSE 0 END) as age2')
                            .select('SUM(CASE WHEN age=2 THEN 1 ELSE 0 END) as age3')
                            .select('SUM(CASE WHEN age=3 THEN 1 ELSE 0 END) as age4')
                            .select('SUM(CASE WHEN age=4 THEN 1 ELSE 0 END) as age5')
                            .select('SUM(CASE WHEN age=5 THEN 1 ELSE 0 END) as age6')
                            .select('SUM(CASE WHEN age=6 THEN 1 ELSE 0 END) as age7')
                            .select('SUM(CASE WHEN age=7 THEN 1 ELSE 0 END) as age8')
                            .select('SUM(CASE WHEN age=8 THEN 1 ELSE 0 END) as age9')
                            .select('SUM(CASE WHEN enjoyment=0 THEN 1 ELSE 0 END) as enjoyment1')
                            .select('SUM(CASE WHEN enjoyment=1 THEN 1 ELSE 0 END) as enjoyment2')
                            .select('SUM(CASE WHEN learn=0 THEN 1 ELSE 0 END) as learn1')
                            .select('SUM(CASE WHEN learn=1 THEN 1 ELSE 0 END) as learn2')
                            .select('SUM(CASE WHEN position=0 THEN 1 ELSE 0 END) as position1')
                            .select('SUM(CASE WHEN position=1 THEN 1 ELSE 0 END) as position2')
                            .select('SUM(CASE WHEN position=2 THEN 1 ELSE 0 END) as position3')
                            .select('SUM(CASE WHEN position=3 THEN 1 ELSE 0 END) as position4')
                            .select('SUM(CASE WHEN position=4 THEN 1 ELSE 0 END) as position5')
                            .select('SUM(CASE WHEN position=5 THEN 1 ELSE 0 END) as position6')
                            .select('SUM(CASE WHEN post=0 THEN 1 ELSE 0 END) as post1')
                            .select('SUM(CASE WHEN post=1 THEN 1 ELSE 0 END) as post2')
                            .select('SUM(CASE WHEN post=2 THEN 1 ELSE 0 END) as post3')
                            .select('SUM(CASE WHEN post=3 THEN 1 ELSE 0 END) as post4')
                            .select('SUM(CASE WHEN post=4 THEN 1 ELSE 0 END) as post5')
                            .select('SUM(CASE WHEN post=5 THEN 1 ELSE 0 END) as post6')
                            .select('SUM(CASE WHEN income=0 THEN 1 ELSE 0 END) as income1')
                            .select('SUM(CASE WHEN income=1 THEN 1 ELSE 0 END) as income2')
                            .select('SUM(CASE WHEN income=2 THEN 1 ELSE 0 END) as income3')
                            .select('SUM(CASE WHEN income=3 THEN 1 ELSE 0 END) as income4')
                            .select('SUM(CASE WHEN income=4 THEN 1 ELSE 0 END) as income5')
                            .select('SUM(CASE WHEN income=5 THEN 1 ELSE 0 END) as income6')
                            .select('SUM(CASE WHEN income=6 THEN 1 ELSE 0 END) as income7')
                            .select('SUM(CASE WHEN income=7 THEN 1 ELSE 0 END) as income8')
                            .select('SUM(CASE WHEN working_hours=0 THEN 1 ELSE 0 END) as working_hours1')
                            .select('SUM(CASE WHEN working_hours=1 THEN 1 ELSE 0 END) as working_hours2')
                            .select('SUM(CASE WHEN working_hours=2 THEN 1 ELSE 0 END) as working_hours3')
                            .select('SUM(CASE WHEN working_hours=3 THEN 1 ELSE 0 END) as working_hours4')
                            .select('SUM(CASE WHEN working_hours=4 THEN 1 ELSE 0 END) as working_hours5')
                            .select('SUM(CASE WHEN working_hours=5 THEN 1 ELSE 0 END) as working_hours6')
                            .select('SUM(CASE WHEN working_hours=6 THEN 1 ELSE 0 END) as working_hours7')
                            .select('SUM(CASE WHEN working_hours=7 THEN 1 ELSE 0 END) as working_hours8')
                            .select('SUM(CASE WHEN holiday_days=0 THEN 1 ELSE 0 END) as holiday_days1')
                            .select('SUM(CASE WHEN holiday_days=1 THEN 1 ELSE 0 END) as holiday_days2')
                            .select('SUM(CASE WHEN holiday_days=2 THEN 1 ELSE 0 END) as holiday_days3')
                            .select('SUM(CASE WHEN overtime_pay=0 THEN 1 ELSE 0 END) as overtime_pay1')
                            .select('SUM(CASE WHEN overtime_pay=1 THEN 1 ELSE 0 END) as overtime_pay2')
                            .select('SUM(CASE WHEN overtime_pay=2 THEN 1 ELSE 0 END) as overtime_pay3')
                            .select('SUM(CASE WHEN illegality=0 THEN 1 ELSE 0 END) as illegality1')
                            .select('SUM(CASE WHEN illegality=1 THEN 1 ELSE 0 END) as illegality2')
                            .select('SUM(CASE WHEN illegality=2 THEN 1 ELSE 0 END) as illegality3')
                            .select('SUM(CASE WHEN illegality=3 THEN 1 ELSE 0 END) as illegality4')
                            .select('SUM(CASE WHEN interview_attitude=0 THEN 1 ELSE 0 END) as interview_attitude1')
                            .select('SUM(CASE WHEN interview_attitude=1 THEN 1 ELSE 0 END) as interview_attitude2')
                            .select('SUM(CASE WHEN interview_attitude=2 THEN 1 ELSE 0 END) as interview_attitude3')
                            .select('SUM(CASE WHEN resume=0 THEN 1 ELSE 0 END) as resume1')
                            .select('SUM(CASE WHEN resume=1 THEN 1 ELSE 0 END) as resume2')
                            .select('SUM(CASE WHEN resume=2 THEN 1 ELSE 0 END) as resume3')
                            .select('SUM(CASE WHEN stress_interview=0 THEN 1 ELSE 0 END) as stress_interview1')
                            .select('SUM(CASE WHEN stress_interview=1 THEN 1 ELSE 0 END) as stress_interview2')
                            .select('SUM(CASE WHEN sexual_harassment=0 THEN 1 ELSE 0 END) as sexual_harassment1')
                            .select('SUM(CASE WHEN sexual_harassment=1 THEN 1 ELSE 0 END) as sexual_harassment2')
                            .select('SUM(CASE WHEN interviewer_count=0 THEN 1 ELSE 0 END) as interviewer_count1')
                            .select('SUM(CASE WHEN interviewer_count=1 THEN 1 ELSE 0 END) as interviewer_count2')
                            .select('SUM(CASE WHEN interviewer_count=2 THEN 1 ELSE 0 END) as interviewer_count3')
                            .select('SUM(CASE WHEN interviewer_count=3 THEN 1 ELSE 0 END) as interviewer_count4')
                            .select('SUM(CASE WHEN interviewer_count=4 THEN 1 ELSE 0 END) as interviewer_count5')
                            .select('SUM(CASE WHEN promise=0 THEN 1 ELSE 0 END) as promise1')
                            .select('SUM(CASE WHEN promise=1 THEN 1 ELSE 0 END) as promise2')
    @student_evaluations = @company.student_evaluations.group(:company_id)
                            .group(:company_id)
                            .select('company_id')
                            .select('SUM(CASE WHEN age=0 THEN 1 ELSE 0 END) as age1')
                            .select('SUM(CASE WHEN age=1 THEN 1 ELSE 0 END) as age2')
                            .select('SUM(CASE WHEN age=2 THEN 1 ELSE 0 END) as age3')
                            .select('SUM(CASE WHEN age=3 THEN 1 ELSE 0 END) as age4')
                            .select('SUM(CASE WHEN age=4 THEN 1 ELSE 0 END) as age5')
                            .select('SUM(CASE WHEN age=5 THEN 1 ELSE 0 END) as age6')
                            .select('SUM(CASE WHEN age=6 THEN 1 ELSE 0 END) as age7')
                            .select('SUM(CASE WHEN age=7 THEN 1 ELSE 0 END) as age8')
                            .select('SUM(CASE WHEN age=8 THEN 1 ELSE 0 END) as age9')
                            .select('SUM(CASE WHEN illegality=0 THEN 1 ELSE 0 END) as illegality1')
                            .select('SUM(CASE WHEN illegality=1 THEN 1 ELSE 0 END) as illegality2')
                            .select('SUM(CASE WHEN illegality=2 THEN 1 ELSE 0 END) as illegality3')
                            .select('SUM(CASE WHEN illegality=3 THEN 1 ELSE 0 END) as illegality4')
                            .select('SUM(CASE WHEN interview_attitude=0 THEN 1 ELSE 0 END) as interview_attitude1')
                            .select('SUM(CASE WHEN interview_attitude=1 THEN 1 ELSE 0 END) as interview_attitude2')
                            .select('SUM(CASE WHEN interview_attitude=2 THEN 1 ELSE 0 END) as interview_attitude3')
                            .select('SUM(CASE WHEN resume=0 THEN 1 ELSE 0 END) as resume1')
                            .select('SUM(CASE WHEN resume=1 THEN 1 ELSE 0 END) as resume2')
                            .select('SUM(CASE WHEN resume=2 THEN 1 ELSE 0 END) as resume3')
                            .select('SUM(CASE WHEN stress_interview=0 THEN 1 ELSE 0 END) as stress_interview1')
                            .select('SUM(CASE WHEN stress_interview=1 THEN 1 ELSE 0 END) as stress_interview2')
                            .select('SUM(CASE WHEN sexual_harassment=0 THEN 1 ELSE 0 END) as sexual_harassment1')
                            .select('SUM(CASE WHEN sexual_harassment=1 THEN 1 ELSE 0 END) as sexual_harassment2')
                            .select('SUM(CASE WHEN interviewer_count=0 THEN 1 ELSE 0 END) as interviewer_count1')
                            .select('SUM(CASE WHEN interviewer_count=1 THEN 1 ELSE 0 END) as interviewer_count2')
                            .select('SUM(CASE WHEN interviewer_count=2 THEN 1 ELSE 0 END) as interviewer_count3')
                            .select('SUM(CASE WHEN interviewer_count=3 THEN 1 ELSE 0 END) as interviewer_count4')
                            .select('SUM(CASE WHEN interviewer_count=4 THEN 1 ELSE 0 END) as interviewer_count5')
                            .select('SUM(CASE WHEN promise=0 THEN 1 ELSE 0 END) as promise1')
                            .select('SUM(CASE WHEN promise=1 THEN 1 ELSE 0 END) as promise2')

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @evaluations }
    end
  end

  # GET /companies/new
  # GET /companies/new.xml
  def new
    @company = Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @company }
    end
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies
  # POST /companies.xml
  def create
    @company = Company.new(params[:company])

    respond_to do |format|
      if @company.save
        format.html { redirect_to :action => "index",:controller => "companies" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.xml
  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to(@company, :notice => 'Company was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.xml
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to(companies_url) }
      format.xml  { head :ok }
    end
  end
  
  def evaluation_attribute
    @evaluation_age = Evaluation::AGE
    @evaluation_enjoyment = Evaluation::ENJOYMENT
    @evaluation_learn = Evaluation::LEARN
    @evaluation_job_type = Evaluation::JOB_TYPE
    @evaluation_position = Evaluation::POSITION
    @evaluation_post = Evaluation::POST
    @evaluation_income = Evaluation::INCOME
    @evaluation_working_hours = Evaluation::WORKING_HOURS
    @evaluation_holiday_days = Evaluation::HOLIDAY_DAYS
    @evaluation_overtime_pay = Evaluation::OVERTIME_PAY
    @evaluation_illegality = Evaluation::ILLEGALITY
    @evaluation_interview_attitude = Evaluation::INTERVIEW_ATTITUDE
    @evaluation_resume = Evaluation::RESUME
    @evaluation_stress_interview = Evaluation::STRESS_INTERVIEW
    @evaluation_sexual_harassment = Evaluation::SEXUAL_HARASSMENT
    @evaluation_interviewer_count = Evaluation::INTERVIEWER_COUNT
    @evaluation_promise = Evaluation::PROMISE
  end
end

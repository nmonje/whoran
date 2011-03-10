class RunsController < ApplicationController
  # GET /runs
  # GET /runs.xml
  def index
  	if current_user.nil?
  		@runs = Runs.all
  	else
	    @runs = current_user.runs
		end
		
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @runs }
    end
  end

  # GET /runs/1
  # GET /runs/1.xml
  def show
    @run = Run.find(params[:id])
    @user = User.find_by_id(@run.user_id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @run }
    end
  end

  # GET /runs/new
  # GET /runs/new.xml
  def new
    @run = Run.new
    @run.time = Time.utc(0)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @run }
    end
  end

  # GET /runs/1/edit
  def edit
    @run = Run.find(params[:id])
  end

  # POST /runs
  # POST /runs.xml
  def create
    @run = Run.new(params[:run])
    if not current_user.nil?
    	@run.user_id = current_user.id
		  respond_to do |format|
		    if @run.save
		      format.html { redirect_to(runs_url, :notice => 'Run was successfully created.') }
		      format.xml  { render :xml => runs_url, :status => :created, :location => @run }
		    else
		      format.html { render :action => "new" }
		      format.xml  { render :xml => @run.errors, :status => :unprocessable_entity }
		    end
	    end
    else
    	redirect_to root_path
    end
  end

  # PUT /runs/1
  # PUT /runs/1.xml
  def update
    @run = Run.find(params[:id])

    respond_to do |format|
      if @run.update_attributes(params[:run])
        format.html { redirect_to(runs_url, :notice => 'Run was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @run.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /runs/1
  # DELETE /runs/1.xml
  def destroy
    @run = Run.find(params[:id])
    @run.destroy

    respond_to do |format|
      format.html { redirect_to(runs_url) }
      format.xml  { head :ok }
    end
  end
end

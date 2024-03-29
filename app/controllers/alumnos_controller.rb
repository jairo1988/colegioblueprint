class AlumnosController < ApplicationController
  before_filter :correct_user, :only => [:edit, :update]
  # GET /alumnos
  # GET /alumnos.json
  def index
    @title = "All Alumnos"
    @alumnos = Alumno.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @alumnos }
    end
  end

  # GET /alumnos/1
  # GET /alumnos/1.json
  def show
    @alumno = Alumno.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @alumno }
    end
  end

  # GET /alumnos/new
  # GET /alumnos/new.json
  def new
    @alumno = Alumno.new
    @alumno.user = User.new
    @title= "Sign up"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @alumno }
    end
  end

  # GET /alumnos/1/edit
  def edit
    @alumno = Alumno.find(params[:id])
    @title="Edit User"
  end

  # POST /alumnos
  # POST /alumnos.json
  def create
    @alumno = Alumno.new(params[:alumno])

    respond_to do |format|
      if @alumno.save
        format.html { redirect_to @alumno, notice: 'Alumno was successfully created.' }
        format.json { render json: @alumno, status: :created, location: @alumno }
      else
        @title="Sign Up"
        format.html { render action: "new" }
        format.json { render json: @alumno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /alumnos/1
  # PUT /alumnos/1.json
  def update
    @alumno = Alumno.find(params[:id])

    respond_to do |format|
      if @alumno.update_attributes(params[:alumno])
        format.html { redirect_to @alumno, notice: 'Alumno was successfully updated.' }
        format.json { head :ok }
      else
        @title="Edit User"
        format.html { render action: "edit" }
        format.json { render json: @alumno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alumnos/1
  # DELETE /alumnos/1.json
  def destroy
    @alumno = Alumno.find(params[:id])
    @alumno.destroy

    respond_to do |format|
      format.html { redirect_to alumnos_url }
      format.json { head :ok }
    end
  end

private
  def correct_user
    @alumno = Alumno.find(params[:id])
    if !(current_user?(@alumno.user) || current_user.role == "Administrador")
      redirect_to(root_path, :notice => "No tienes permiso para modificar este usuario.")
    end
  end

end


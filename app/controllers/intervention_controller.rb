class InterventionController < ApplicationController

  def get_customers
    customers = Customer.all
    respond_to do |format|
      format.json { render :json => customers }
    end
  end
  def get_buildings_by_customer
    buildings = Building.where("customer_id = ?", params[:id])
    respond_to do |format|
      format.json { render :json => buildings }
    end
  end
  def get_batteries_by_building
    batteries = Battery.where("building_id = ?", params[:id])
    respond_to do |format|
      format.json { render :json => batteries }
    end
  end 
  def get_columns_by_battery
    columns = Column.where("battery_id = ?", params[:id])
    respond_to do |format|
      format.json { render :json => columns }
    end
  end 
  def get_elevators_by_column
    elevators = Elevator.where("column_id = ?", params[:id])
    respond_to do |format|
      format.json { render :json => elevators }
    end
  end
  def get_employees
    employees = Employee.all
    respond_to do |format|
      format.json { render :json => employees }
    end
  end
  
end

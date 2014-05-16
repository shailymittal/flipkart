class FileCsvController < ApplicationController
  $user=Array.new
  def read
    require 'csv' 
    @users = Array.new
    CSV.open('user.csv', 'rb').each do |row|
      hash=Hash.new
      hash['id']=row[0]
      hash['name']=row[1]
      hash['contact_no']=row[2]
      hash['email']=row[3]
      #Hash.[]("id", "name", "contact_no", "email")
     # @users.push({id: row[0], name: row[1],contact_no: row[2],email: row[3]})
     @users.push(hash)
     $user=@users
    end
  end

  def write
    hash=Hash.new
    hash['id']=params['id']
    hash['name']=params['name']
    hash['contact_no']=params['contact_no']
    hash['email']=params['email']
    $user.push(hash)
    f=File.open('user.csv','wb')
    $user.each do |element|
#      f.syswrite(element.join(","))
    f.syswrite(element['id'])
    f.syswrite(",")
    f.syswrite(element['name'])
    f.syswrite(",")
    f.syswrite(element['contact_no'])
    f.syswrite(",")
    f.syswrite(element['email'])
    f.syswrite "\n"
    end
    
  end
  
  def new 
  end
  
end

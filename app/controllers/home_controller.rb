class HomeController < ApplicationController
  def index
    # render plain: "Hello World from rails 7"

    # render html: "<h1>Hello World from rails 7</h1>".html_safe

    message = "<h1>Hello World from rails 7</h1>"
    message += "<h2>Hello World from rails 7</h2>"
    message += "<h3>Hello World from rails 7</h3>"
    message += "<h4>Hello World from rails 7</h4>"
    message += "<h5>Hello World from rails 7</h5>"
    message += "<h6>Hello World from rails 7</h6>"

    render html: message.html_safe
  end

  def getquerystringvalues
    message = ""
    if params[:message]
      message += "<h1>Message is " + params[:message] + "</h1>"
    else
      message += "<h1>You haven't received any message yet</h1>"
    end
    if params[:country]
      message += "<h1>Message is " + params[:country] + "</h1>"
    else
      message += "<h1>You haven't received any message yet</h1>"
    end

    message += "<h1>Controller name is " + params[:controller] + "</h1>"
    message += "<h1>Action name is " + params[:action] + "</h1>"

    render html: message.html_safe
  end
  def passdatatoviews
    @message = "<h1>Hello World from rails 7</h1>"
    @message += "<h2>Hello World from rails 7</h2>"
    @message += "<h3>Hello World from rails 7</h3>"
    @message += "<h4>Hello World from rails 7</h4>"
    @message += "<h5>Hello World from rails 7</h5>"
    @message += "<h6>Hello World from rails 7</h6>"
  end
  def showdatetimeinfo
    @currenttime = DateTime.now
  end

  def conditionalrendering
    @data = {
      "name":"Wiktor",
      "isvisible":true,
      "loggedin":true,
      "country":"United States",
      "workexperience":45,
      "statecode":nil
  }
  end

  def loopingthrougharrays
    @Products = []

    fnum = 10
    snum = 5
    add = fnum + snum
    divide = fnum - snum
    @Products.push({"productid":1, "productname":"AMD ryzen 3990", "quantity":100, "unitsInStock":50, "disContinued":false, "cost":3000})
    @Products.push({"productid":2, "productname":"AMD ryzen 3980", "quantity":100, "unitsInStock":50, "disContinued":false, "cost":4000})
    @Products.push({"productid":3, "productname":"AMD ryzen 3970", "quantity":100, "unitsInStock":50, "disContinued":false, "cost":5000})
    @Products.push({"productid":4, "productname":"AMD ryzen 3960", "quantity":100, "unitsInStock":50, "disContinued":false, "cost":6000})
    @Products.push({"productid":5, "productname":"AMD ryzen 3950", "quantity":100, "unitsInStock":50, "disContinued":false, "cost":7000})
  end

  def LoadUsers()
    base_url = "https://fakestoreapi.com/users"
    @users = CallRestAPI(base_url)
  end

  def LoadUsers2()
    base_url = "https://fakestoreapi.com/users"
    @users = CallRestAPI(base_url)
    @image = "https://i.pravatar.cc/"
  end

  def CallRestAPI(base_url)
    response =HTTParty.get(base_url)
    return response.success? ? response : []
  end

  def LoadUserDetails()
    id=params[:id].to_i

    if (id < 1 || id > 10)
      redirect_to LoadUserDetails_path(1)
      return
    end

    response =HTTParty.get("https://fakestoreapi.com/users/#{id}")
    if response.success?
      @user = response
    end
    def ShowUserDetails()
      redirect_to LoadUserDetails_path(1)
    end
  end
end

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
      'name':'Wiktor',
      'isvisible':true,
      'loggedin':true,
      'country':'United States',
      'workexperience':45,
      'statecode':nil
  }
  end
end

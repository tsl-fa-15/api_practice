require 'open-uri'
require 'json'

class AuthApiController < ApplicationController
  def mashape_intro_form
    #=== Example =====================================
    # Create a form that sends text to the mashape_intro_process
    # action.
    #
    # Ref: https://www.mashape.com/ismaelc/yoda-speak
    #================================================
  end

  def mashape_intro_process
    #=== Example =====================================
    # Use the Yoda Speak API in the Mashape platform to
    # translate text into Yoda speak. Make sure the 'unirest' gem
    # is installed in your gemfile.
    #
    # Ref: https://www.mashape.com/ismaelc/yoda-speak
    #================================================
    user_text = URI.encode(params[:text])
    response = Unirest.get "https://yoda.p.mashape.com/yoda",
      headers:{
        "X-Mashape-Key" => "mLkvKPbISwmsh9qoL0dOebGWtsS2p1mK4hZjsnLY30eb9bP4DO",
        "Accept" => "text/plain"
      },
      parameters:{ :sentence => user_text }
      @result = response.body
  end

  def face_detection_form
    #=== Instructions ===================================
    # Create a form that lets a user send a image url to the
    # face_detection_process action
    #
    # Ref: https://www.mashape.com/faceplusplus/faceplusplus-face-detection
    #================================================
  end

  def face_detection
    #=== Instructions ===================================
    # Use the Face Detection API in the Mashape platform to
    # display data about a user-submitted image URL
    #
    # Ref: https://www.mashape.com/faceplusplus/faceplusplus-face-detection
    #================================================
    user_text = URI.encode(params[:image_url])
    response = Unirest.get "https://faceplusplus-faceplusplus.p.mashape.com/detection/detect?attribute=glass%2Cpose%2Cgender%2Cage%2Crace%2Csmiling&url=#{user_text}",
      headers:{
        "X-Mashape-Key" => "mLkvKPbISwmsh9qoL0dOebGWtsS2p1mK4hZjsnLY30eb9bP4DO",
        "Accept" => "application/json"
      }

      # raise response.body.inspect
      @result = response.body

  end

  def sentiment_analysis_form
    #=== Instructions ===================================
    # Create a form that lets a user send an article url to the
    # sentiment_analysis_process action
    #
    # Ref: https://www.mashape.com/loudelement/free-natural-language-processing-service
    #================================================
  end

  def sentiment_analysis
    #=== Instructions ===================================
    # Use the Face Detection API in the Mashape platform to
    # display data about a user-submitted image URL
    #
    # Ref: https://www.mashape.com/loudelement/free-natural-language-processing-service
    #================================================
    user_text = URI.encode(params[:text])
    begin
      response = Unirest.post "https://community-sentiment.p.mashape.com/text/",
        headers:{
          "X-Mashape-Key" => "mLkvKPbISwmsh9qoL0dOebGWtsS2p1mK4hZjsnLY30eb9bP4DO",
          "Content-Type" => "application/x-www-form-urlencoded",
          "Accept" => "application/json"
        },
        parameters:{
          "txt" => "#{params[:text]}"
        }
        @result = response.body
      rescue
        @result = 'Something went wrong'
      end
  end
end

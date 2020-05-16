class MagicController < ApplicationController
  
  def web_form
    render({ template: "magic_templates/blank_web_form.html.erb" })  
  end

  def web_results
      require "google/cloud/vision"
  
  image_annotator = Google::Cloud::Vision::ImageAnnotator.new
  
  uploaded_data = params.fetch("zebra")

  a_file = File.open(uploaded_data)

  vision_api_results = image_annotator.web_detection({ :image => a_file })

  @responses = vision_api_results.responses

  @first_result = vision_api_results.responses.at(0)


     render({ template: "magic_templates/final_web_results.html.erb" })  
  end

def text_form
    render({ template: "magic_templates/blank_text_form.html.erb" })  
  end

  def text_results

  require "google/cloud/vision"
  
  image_annotator = Google::Cloud::Vision::ImageAnnotator.new
  
  uploaded_data = params.fetch("text_file")

  a_file = File.open(uploaded_data)

  vision_api_results = image_annotator.text_detection({ :image => a_file })

  @responses = vision_api_results.responses

  @first_result = vision_api_results.responses.at(0)


     render({ template: "magic_templates/final_text_results.html.erb" })  
  end

  def label_form
    render({ template: "magic_templates/blank_label_form.html.erb" })  
  end

  def label_results
require "google/cloud/vision"
  
  image_annotator = Google::Cloud::Vision::ImageAnnotator.new
  
  uploaded_data = params.fetch("label_file")

  a_file = File.open(uploaded_data)

  vision_api_results = image_annotator.label_detection({ :image => a_file })

  @responses = vision_api_results.responses

  @first_result = vision_api_results.responses.at(0)


     render({ template: "magic_templates/final_label_results.html.erb" })  
  end


end
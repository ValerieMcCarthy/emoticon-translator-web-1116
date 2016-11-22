require "yaml"
require "pry"

def load_library (file_path)
  emoticons = YAML.load_file(file_path)
  emoticons_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |key, value|
  	emoticons_hash["get_meaning"][value[1]] = key
  	emoticons_hash["get_emoticon"][value[0]] = value[1]
  	end
  #binding.pry
  emoticons_hash
end

def get_japanese_emoticon (file_path, eng_emoticon)
  emoticons_hash = load_library(file_path)
  jap_emoticon = ""
  jap_emoticon = emoticons_hash["get_emoticon"][eng_emoticon]
  if jap_emoticon 
  	return jap_emoticon
  else
   "Sorry, that emoticon was not found"
  end
end

def get_english_meaning (file_path, jap_emoticon)
  emoticons_hash = load_library(file_path)
  eng_meaning = ""
  eng_meaning = emoticons_hash["get_meaning"][jap_emoticon]
  if eng_meaning
  	return eng_meaning
  else
   "Sorry, that emoticon was not found"
  end
end

#load_library ("lib/emoticons.yml")
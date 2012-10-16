require 'digest/sha2'

class ApplicationController < ActionController::Base
    
  #before_filter :checarLogin
  
  protect_from_forgery
  
  private

  def checarLogin
    authenticate_or_request_with_http_basic('Login requerido! CHAVE e SENHA') do |username, password|
      verificarUser(username, password)
    end
  end
  
  def verificarUser(chave, senha)

    if @usuario = Usuario.first(:conditions => ["chave = ? AND senha = ?", chave.upcase!, Digest::SHA2.hexdigest("Linux #{senha} sudo").force_encoding('UTF-8')])
      true
    end
  end
  
end

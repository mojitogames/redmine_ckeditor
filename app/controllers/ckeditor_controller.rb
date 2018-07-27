class CkeditorController < ApplicationController

  protect_from_forgery except: :upload
  def upload
    logger.info(request.host_with_port.to_s)
    logger.info(request.base_url.to_s)
    now = Time.now
    dir = Rails.root.join('public', 'uploads', now.strftime("%Y"), now.strftime("%m"), now.strftime("%d"))
    FileUtils.mkdir_p(dir) unless Dir.exist?(dir)
    uploaded_io = params[:upload]
    #File.open(dir.join(uploaded_io.original_filename), 'wb') do |file|
    saved_filename = SecureRandom.urlsafe_base64 + File.extname(uploaded_io.original_filename)
    File.open(dir.join(saved_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    render json: { "uploaded": 1, "fileName": saved_filename, "url": URI::join(request.base_url.to_s, now.strftime("/uploads/%Y/%m/%d/"), saved_filename).to_s }
  end

  def user_autocomplete
    value = params[:value].to_s
    value = value.strip
    users_list = User.like(value).sorted.active.map { |u| { id: u.id, fullname: u.name, email: u.mail, username: u.login, avatar: u.avatar ? (url_for :only_path => false, :controller => "people", :action => "avatar", :id => u.avatar, :size => 14) : "/plugin_assets/redmine_people/images/person.png" } }

    #render json: { users: users_list }
    render json: users_list
  end

end

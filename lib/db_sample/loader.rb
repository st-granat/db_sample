# coding: utf-8
module DbSample
  module Loader
    class << self
      def get_list_value(block, key)
        block.split("\n").find {|e| e.split(":")[0] == "#{key}"}.split("#{key}:")[1].strip
      end

      def ck_file_path(path)
        file = "#{Rails.root}/db/sample/#{path}"
        object = Ckeditor::AttachmentFile.create!(:data => File.new(file))
        object.data.url
      end

      def ck_image_path(path)
        file = "#{Rails.root}/db/sample/#{path}"
        object = Ckeditor::Picture.create!(:data => File.new(file))
        object.data.url(:content)
      end
    end
  end
end

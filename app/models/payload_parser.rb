class PayloadParser
  def self.get_type(params)
    type = :response_type_not_supported

    list_files.each do |file_path|
      filename = File.basename(file_path, ".rb")
      schema_class = "Schema::#{filename.classify}".constantize

      if schema_class.body == params.keys
        type = filename.to_sym
        break
      end
    end

    type
  end

  def self.list_files
    Dir["./app/models/schema/*.rb"]
  end
end
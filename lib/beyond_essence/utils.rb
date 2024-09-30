# frozen_string_literal: true

module BeyondEssence
  module Utils
    def get_directory_file_names(directory, extension)
      return [] unless Dir.exist?(directory)

      Dir.entries(directory)
         .select { |file| File.extname(file) == ".#{extension}" }
         .map { |file| File.basename(file, ".#{extension}") }
    end
  end
end

module Paperclip
  class Transparency < Thumbnail
    # Find the background and replace with transparency.
    # -fuzz 20% simulates antialiasing
    CONVERT_OPTIONS = [
      '-alpha', 'set',
      '-fill', 'white',
      '-draw', "'color 0,0 replace'",
      '-fuzz', '20%',
      '-transparent', 'white'
    ]

    # Append the convert options to existing options 
    # defined via style and convert_options
    def transformation_command
      super + CONVERT_OPTIONS
    end
  end
end
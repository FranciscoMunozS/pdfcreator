class UserPdf < Prawn::Document
  def initialize(user, view)
     super()
     text "This is an user"
   end
end

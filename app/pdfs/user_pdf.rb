class UserPdf < Prawn::Document
  def initialize(user, view)
     super()
     @user = user
     @view = view
     logo
     body
     equipment_information
     first_rule
     second_rule
     third_rule
     footer
  end
  def logo
    logopath =  "#{Rails.root}/app/assets/images/logo.jpg"
    image logopath, :width => 100, :height => 80
    move_down 3
    draw_text 'Acta de entrega de equipos', :at => [175, 575], size: 12
  end
  def body
    move_down 80
    text "En Valdivia, a 30 de MARZO de 2017, el Gobierno Regional de Los Ríos, R.U.T. N° 61.978.900-8, cede al Sr. #{@user.name}, el equipamiento que se individualiza como:", size: 10
  end
  def equipment_information
    move_down 10
    data = [["Cantidad", "Equipo", "N° de serie",],
           ["1                 ", "Monitor LG 24 24MP58                                      ", "609NTBKDU317                          "]]
    table data, :position => :center
  end
  def first_rule
    move_down 30
    text "PRIMERO: Mediante el presente instrumento, Gobierno Regional de los Ríos cede a préstamo de uso el equipamiento individualizado en la cláusula anterior, al Sr. #{@user.name}. El uso de este equipamiento debe ser concordante con las actividades asignadas al cargo que desempeña el receptor.", size: 10
  end
  def second_rule
    move_down 15
    text "SEGUNDO: En este acto, Gobierno Regional de los Ríos pone a disposición del funcionario el aludido equipamiento quien declara haberlo recibido y revisado a su entera satisfacción y lo acepta en el estado en que se encuentra (Nuevo), el que es conocido por él. Por su parte, durante la vigencia del préstamo, el receptor responderá del menoscabo, deterioro o destrucción de los equipos, determinada a través de simple investigación o sumario administrativo.", size: 10
  end
  def third_rule
    move_down 15
    text "TERCERO: Esta cesión tendrá vigencia a contar de la fecha de su suscripción y en forma definida hasta que el funcionario deje de prestar servicios en el cargo para el cual ha sido designado o contratado, si ninguna de las partes manifiesta su intención de ponerle término en forma anticipada. Por su parte, Gobierno Regional de Los Ríos, en virtud del presente acto, tiene la facultad de solicitar al receptor la restitución anticipada del equipo, si se comprueba que éste no está siendo empleado según el uso convenido y en condiciones que no sean concordantes con las actividades asignadas al cargo que desempeña.", size: 10
  end
  def fourth_rule
    move_down 15
    text "CUARTO: Esta acta se otorga en dos ejemplares, de la misma fecha  y tenor, quedando una en poder del Gobierno Regional de los Ríos y la otra en poder del receptor."
  end
  def footer
    move_down 15
    text "Firman en señal de aceptación:", size:10
    move_down 60
    text_box "Sr. #{@user.name}", :at => [10, 180], size: 10
    text_box "GORE de Los Ríos", :at => [10, 170], size: 10
    text_box 'Sr. Patricio Acum Salinas', :at => [315, 180], size: 10
    text_box 'Encargado de Unidad de informatica', :at => [315, 170], size: 10
    text_box 'GORE de Los Rios', :at => [315, 160], size: 10
  end
end

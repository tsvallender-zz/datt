class Todo < Note
  validates :due_date, presence: true

  # Route todos to the notes path
  model_name.class_eval do
    def route_key
      'notes'
    end
    def singular_route_key
      superclass.model_name.singular_route_key
    end
  end
end

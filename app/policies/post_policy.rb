class PostPolicy < ApplicationPolicy

def new
  @post = Post.new
    authorize @post
end

def index?
  true
end

def create?
  user.present?
end
 #keeping things DRY...
def update?
  create?
end

def destroy?
  create?
end
  

end
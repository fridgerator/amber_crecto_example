class UserController < ApplicationController
  def index
    users = Repo.all(User)
    render("index.slang")
  end

  def show
    if user = Repo.get(User, params["id"])
      render("show.slang")
    else
      flash["warning"] = "User with ID #{params["id"]} Not Found"
      redirect_to "/users"
    end
  end

  def new
    user = User.new
    changeset = User.changeset(user)
    render("new.slang")
  end

  def create
    user = User.new
    user.update_from_hash(params.to_h.select(["first_name", "last_name", "age", "height"]))
    changeset = Repo.insert(user)

    if changeset.errors.any?
      flash["danger"] = "Could not create User!"
      render("new.slang")
    else
      flash["success"] = "Created User successfully."
      redirect_to "/users"
    end
  end

  def edit
    if user = Repo.get(User, params["id"])
      changeset = User.changeset(user)
      render("edit.slang")
    else
      flash["warning"] = "User with ID #{params["id"]} Not Found"
      redirect_to "/users"
    end
  end

  def update
    if user = Repo.get(User, params["id"])
      user.update_from_hash(params.to_h.select(["first_name", "last_name", "age", "height"]))
      changeset = Repo.update(user)

      if changeset.errors.any?
        flash["danger"] = "Could not update User!"
        render("edit.slang")
      else
        flash["success"] = "Updated User successfully."
        redirect_to "/users"
      end
    else
      flash["warning"] = "User with ID #{params["id"]} Not Found"
      redirect_to "/users"
    end
  end

  def destroy
    if user = Repo.get(User, params["id"])
      Repo.delete(user)
    else
      flash["warning"] = "User with ID #{params["id"]} Not Found"
    end
    redirect_to "/users"
  end
end

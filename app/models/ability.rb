class Ability
    include CanCan::Ability
    def initialize(user)
      can :public_recipes, Recipe
      can :read, Recipe, public: true
      if user.present?
        can :manage, [Food, Recipe], user_id: user.id
        can :manage, RecipeFood, recipe: { user_id: user.id }
      end
    end
  end
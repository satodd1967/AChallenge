# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 

<!-- There are 6 has many relationships in the application.
    User
        has_many :owned_challenges, foreign_key: "user_id", class_name: "Challenge"
        has_many :logs
        has_many :challenge_goals
    Log
        has_many :log_scores, :dependent => :destroy
    Challenge
        has_many :challenge_goals, :dependent => :destroy 
    Challenge Goals
        has_many :log_scores, :dependent => :destroy -->

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)

<!-- There are 6 belongs to relationships in the application
    Log
        belongs_to :user
    Log Score
        belongs_to :log
        belongs_to :challenge_goal
    Challenge
        belongs_to :user
    Challenge Goals
        belongs_to :user
        belongs_to :challenge -->

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)

<!-- There are 5 has many through relationships in the application
    User x
        has_many :log_scores, through: :logs
        has_many :challenges, through: :challenge_goals
    Challenges 
         has_many :users, through: :challenge_goals
        has_many :logs, through: :users
        has_many :log_scores, through: :challenge_goals -->
    
- [X] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)

<!-- A User has many Challenges through Challenge Goals and a Challenge has many users through Challenge Goals
    note: Users also have many Owned Challenges -->

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)

<!-- All of the through relationships have user submittable attributes. -->

- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

<!-- The application has several validations ranging from simple prescence to custom validations with assocaited methods like Validate not_in_past on Challenges.  Not all necessary validations are present for the app, but the most common necessary to avoid bad data. -->

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

<!-- There is a scope method last_first that sorts the logs on the Users show page from the most recent to the first. -->

- [x] Include signup (how e.g. Devise)

    <!-- Signup is written using the basic bcrypt and active record functions with hand written validations -->

- [x] Include login (how e.g. Devise)

    <!-- Signup is written using the basic bcrypt and active record functions with hand written validations -->

- [x] Include logout (how e.g. Devise)

    <!-- Logout is present in the app, checks for a logged in user and is present in the navigation on all pages except the root. -->

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)

    <!-- A third party omniauth is implemented for facebook -->

- [x] Include nested resource show or index (URL e.g. users/2/recipes)

    <!-- The user_challenges route is a nested route used in the challenges index page under a section that says view challenges by user.  There are links there that use the nested route to show the challenges index page with only challenges for that user. -->

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)

<!-- The new_challenge_challenge_goal and the challenge_challenge_goals are nested routes used to create a new challenge goal that is tied to an existing challenge. -->

- [x] Include form display of validation errors (form URL e.g. /recipes/new)

    <!-- All new and edit forms as well as the user login and signup pages show the appropriate validation errors. -->

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate

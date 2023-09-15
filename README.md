# Sample Godot FPS Project
Sample FPS project for Unity Refugees who are starting to use Godot.


## What does this project cover?

This project covers the most basic ideas of understanding how to use godot for game projects. The project is an FPS because that's what I believe most people who think Godot "Can't handle" advanced game ideas are trying to make. In no way does this project means to undermine or talk down developers' knowledge, the only reason for this project to exist is to help improve the community and hopefully get more people to use Godot for their own projects. In case you have any suggestions to editing this project, make sure to open a pull request and I'll keep reviewing them so that we can make **THE ULTIMATE GUIDE FOR UNITY -> GODOT MIGRATION**.

## What links are important to understanding this project more?

Here goes a list of all the important links **ANY** newcomer should read when starting out Godot:

 - [Overview of Godot's Key Concepts](https://docs.godotengine.org/en/stable/getting_started/introduction/key_concepts_overview.html#doc-key-concepts-overview)
 - [Nodes and Scenes](https://docs.godotengine.org/en/stable/getting_started/step_by_step/nodes_and_scenes.html)
 - [Vector Math](https://docs.godotengine.org/en/stable/tutorials/math/vector_math.html)
 - [Matrices and Transforms](https://docs.godotengine.org/en/3.1/tutorials/math/matrices_and_transforms.html)

The following list is of important links **I WOULD RECOMMEND** to people who are either not too acquainted with some advanced concepts in game development or are just trying to do something that is a little bit more advanced:

 - [Advanced Vector Math](https://docs.godotengine.org/en/stable/tutorials/math/vectors_advanced.html)
 - [Using Multiple Threads](https://docs.godotengine.org/en/stable/tutorials/performance/using_multiple_threads.html)
 - [Exporting for Android](https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_android.html)

There will be a link to a video going through this entire project on YouTube. As soon as the video is up I'll update this README to include a link to that. Since I work at a small Brazilian Dev Studio the video will be spoken in portuguese, but we will add English Subtitles as soon as its up so everyone can understand it. If you guys would like to support me or my studio, consider checking out our instagram (@coop_indiedevs) where we will be updating our current big project that is also made on the Godot Engine.

# THE PROJECT

There are 5 Scenes in the project, each has their own responsibilities and functionalities. I'll try to give a brief overview of each during this segment of the README. I purposely made sure scripts are only available at the root of each scene (Aside from inherited scenes) so that it wouldn't be too confusing looking around multiple sources for script understanding. Throughout this project you'll see that scripts may use the following methods:

      func _ready():

        #Initializing...

        pass

      func _process(delta):

        #Running every frame...

        pass

      func _physics_process(delta):

        #Running 60 times a second...

        pass

      func _input(event):

        #Handling the last processed input signal...

        pass

> # _ready()
>
> Called once when this node is added to the scene tree and is useful for initializing behaviors.
>
> # _process(delta):
>
> Called every rendered frame of the game (Framerate Dependent) Useful for updating visual elements such as UI or anything that needs to be updated as soon as the image on the screen is updated. The *delta* variable holds a float value that represents the amount of time (in seconds) that it took to render the last frame.
>
> # _physics_process(delta):
>
> Similar to _process(), however is called once every **physics frame** which means it is locked at 60 runs a second and is useful for framerate independent behaviors such as movement. The *delta* variable holds the same information as in the _process() method.
>
> # _input(event):
>
> Called every time an input event is handled, that is, whenever you do something in an input device (Keyboard, Mouse, Controller, etc.). The *event* variable holds the event that was just handled, allowing you to write behaviors accordingly.
> 

# Tutorial Glossary

There are a few important Classes and Methods used around in the project, I'll link each one of them to their corresponding docs page and give a brief description on what I use them for.

> # [Node](https://docs.godotengine.org/en/stable/classes/class_node.html)
>
> Basic node that most other nodes in godot inherit from. Has some useful methods and properties that you can use throughout your project.
>
> # [CPUParticles3D](https://docs.godotengine.org/en/stable/classes/class_cpuparticles3d.html)
>
> Node used for creating simple particles systems that run on the CPU. You can also use [GPUParticles3D](https://docs.godotengine.org/en/stable/classes/class_gpuparticles3d.html) if you want to create more complex particle systems that run on the GPU.
>
> # [StaticBody3D](https://docs.godotengine.org/en/stable/classes/class_staticbody3d.html)
>
> Node used for creating collision objects that don't move and will mostly act like walls for your physics bodies.
>
> # [CharacterBody3D](https://docs.godotengine.org/en/stable/classes/class_characterbody3d.html)
>
> Node used to create physics bodies that don't automatically respond to simulated physics and instead require physics behaviors to be coded in a script. Useful for characters or other types of objects that you want to move yourself.
>
> # [SceneTree](https://docs.godotengine.org/en/stable/classes/class_scenetree.html)
>
> Used to access information about the current running application. we can use the *get_tree()* method on any node that inherits from Node to access it.
>
> # [Vector3](https://docs.godotengine.org/pt_BR/latest/classes/class_vector3.html)
>
> Used to manipulate 3-Dimensional vectors. The project makes constant use of the *normalized()* method to make sure the vector's length doesn't exceed 1.
>
> # [RayCast3D](https://docs.godotengine.org/en/stable/classes/class_raycast3d.html)
>
> Used for raycasting in 3D space. The *get_collider()* method is used to access whichever physics object the RayCast is intersecting.
>
> # [AnimationPlayer](https://docs.godotengine.org/en/stable/classes/class_animationplayer.html)
>
> Used for creating, editing and playing animations in your scene.
>
> # [InputMap](https://docs.godotengine.org/en/stable/tutorials/inputs/input_examples.html#inputmap)
>
> Godot uses a built in Input Map class in the project settings where you can configure many inputs for your project.
> 

# Playtest Area.tscn

Main level where you'll be testing the game out. The idea of this scene is just to organize all of the different scenes of our game in a single level so you can play it. The same scene can be potentially duplicated and modified to make other levels.

## Scene Hierarchy

In this scene I have made multiple nodes of the Node type for organizing multiple elements on the scene. The reason for that is that Node is really cheap and wouldn't hurt the rendering of the game too much just for organizing the level. I've separated the scene into the following categories:

  - Environment
    - Meshes: All of the mesh objects in the scene are children of this node.
    - Lights: All lights in the scene are children of this node.
    - Collision Objects: All collision objects present in the scene are children of this node.
    - Enemy Spawn Points: All nodes used for marking down enemy spawn points in the scene are children of this node.
  - Entities: All game entities (Player, enemies, etc.) are children of this node.

I've also added a timer named **"Enemy Spawn Timer"** to be used for handling timed enemy spawns in the scene.

## Scene Script

### _ready()

We just call the *randomize()* function so that every RNG this script does will be different based on runtime. After that, we also connect the *timeout* signal in the *Enemy Spawn Timer* node to the *Spawn Enemy()* function, so that it will be called every time the timer "times out".

### SpawnEnemy()
 
We get the possible spawn points (All children of the *Enemy Spawn Points* node in the scene), a reference to the Player (so we can find out its position later), an Instance of the Enemy Scene file and create an empty array for storing possible spawn positions. Then, for each spawn point we check if it's distance to the player is greater than 10 and, if so, add its position to the *PossibleSpawns* array. After choosing a random position out of all of the *PossibleSpawns* we add the enemy instance to the scene as a child of the *Entities* node.

# Player.tscn

Scene that represents the player character. It uses the CharacterBody3D node as a tree for movement and collision and has many nodes for added functionality.

## Scene Hierarchy

This scene has a few different nodes to help structure the basic concepts of our player character:

 - *Player (CharacterBody3D)*: We used CharacterBody3D as a root for the scene so we have access to movement functions and basic collision handling by default.
  - *Player Collision (CollisionShape3D)*: This node is accessed by its parent to serve as a collision shape of the physics body. In this case, we used a CapsuleShape3D to draw the player's collision.
  - *Camera Pivot (Marker3D)*: This node will serve as a simple transform pivot for the "Head" of the player we will control.
    - *Camera (Camera3D)*: This node serves as our camera to render the 3D scene. If no other Camera3D node is active (*Current* property), this becomes our main render target for the game.
    - *Weapon Pivot (Marker3D)*: This node will also serve as a transform pivot, this time for the weapon our character is holding.
      - *Weapon (3D Object)*: This node is just a default node structure when you add a 3D model (gltf format works best) into the scene. It represents our current weapon.
    - *RayCast3D (RayCast3D)*: This node represents the player's shooting raycast, we will access it's functions to detect colliding enemies for our weapon shooting mechanic.
   - *AnimationPlayer (AnimationPlayer)*: This node is responsible for the animations we will use in our character, in this case it's only a *"Shoot"* animation for our weapon.
   - *CrossHair (Control): A simple hierarchy of control nodes that combine with a Panel node to make a simple crosshair reticle. You can swap it for a *Sprite2D* node in case you want to use a pre-rendered sprite.

## Scene Script

We use the *_ready()* method to capture the mouse cursor at the center of the screen and hide it, so we can actually control our camera with the mouse.

The *_physics_process()* method has 3 main methods being called in it:

> ### MovementHandler()
>
> This method is responsible for handling the player's speed based on input. We create a variable to hold our movement direction, add to it vectors that represent each cardinal direction multiplied by the strength by which the player is pressing their respective actions. Normalize the direction so that it won't have unexpected lengths for moving and then just interpolate our velocity with the desired direction multiplied by the character's speed.
>
> ### ShotHandler()
>
> This method is responsible for handling if the player has executed a shot. We check if the player just pressed the *"Shoot"* action and if it can shoot. If those statements are true, we tell it that it can't shoot, play the shooting animation, check if there is any collision in our shoot raycast and if they are in the group enemy, if so apply damage to them, add a bullet particle and finally wait for some time (based on the amount of shots you can do per second) until allowing the player to shoot again.
>
> ### CrosshairHandler()
>
> This method only checks if we are looking directly to an enemy and, if so, scales and rotates the crosshair to make a visual indicator.
> 

The *_input(event)* method has 1 method call in it, which it passes the current input to:

> ### CameraHandler()
>
> If the passed input is a Mouse Motion, we use its horizontal velocity to rotate the **PLAYER SCENE** around the UP axis and it's vertical velocity to rotate the **CAMERA PIVOT** around the RIGHT axis.
> 

There are some other methods that handle character's death and bullet particle instancing, but those should be pretty self explanatory if you've read the tutorials I've linked in the beggining.

# Enemy.tscn

This scene is the basic enemy that just follows the player and kills it if they touch. Uses most of the same logic as the Player with some added behavior logic for automation.

## Scene Hierarchy

We follow a pretty exact start from the *Player* scene, but there's a few differences:

 - *Health Bar (MeshInstance3D)*: We use this node to create a billboard 3D shape that will serve to show the enemy health in 3D space.
 - *Health Bar View (SubViewport)*: We use this node to create a subscreen that will render the *Enemy Health Bar* scene so we can project that subscreen to our *Health Bar* Node's Texture.

## Scene Script

The *_ready()* method only plays the animation *"Bounce"* on our enemy. Since it's a looped animation, we won't need to keep telling it to play.

The *_physics_process()* method has 4 main methods being called in it:

> ### MovementHandler()
>
> Functions exactly the same as Player's *MovementHandler()*, but instead of calculating movement based on input, it just calculates it based on the direction to the player using simple vector math. We also tell it to look towards the player with a method we created called *FaceDirection()* using the player's direction as a parameter.
>
> ### AttackHandler()
>
> This method checks all collisions that are happening at the time of being called and if any of them is with an object in the group *"Player"* it tells that object to call the method *Die()* on itself.
>
> ### LifeHandler()
>
> This method just checks if our life is equal to or smaller than 0 and if so, tells the enemy to call *queue_free()* on itself (which prepares the object for deletion in memory).
>
> ### GUIHandler()
>
> This method just updates the *Health Bar* Node to match the current health of the enemy.

# Shot Particle.tscn

This method is really simple and it's just for displaying some particles that represent the shot effect.

## Scene Hierarchy

It's just a simple CPUParticles3D node with the parameters tweaked to have the effect we desire.

## Scene Script

It only uses the *_ready()* method and it has a pretty simple logic that starts emitting the particles, wait a specific amount of time than queues itself for deletion.

# Enemy Health Bar.tscn

Another pretty simple object that represents the healthbar of an enemy.

## Scene Hierarchy

It has a *Control* node as its root but the actual important part of it is the *ProgressBar* node that allows us to customize a progress bar.

## Scene Script

This scene has no scripts.

# Observations

This was done in just a day since I didn't have enough time to do it. I'll add more details based on feedback and if anyone is needing clarification on any of the matters for this project. This project is of course free and open source, so you can fork it and expand upon it as you see fit. The entire project was made in 3 hours, most of which were just me trying to make sure everything would be as simple as possible for newbies to understand. Since the project was so rushed, I'm totally aware that there might be parts where it might be difficult to understand the tutorial, in that case just hit me up through our instagram DMs (@coop_indiedevs - we speak portuguese and english). The video tutorial is coming soon that goes over everything mentioned in this written tutorial.

Thanks a lot for the patience and I hope this might be helpful to anyone in the community. Also, if this helped you and you think I deserve something, you can just send me a donation on Paypal using my email: wobbufest@gmail.com. You can also use that email to contact me if you want to clear out any doubts but don't use any kind of social media.

#I hope all of you have a great time learning the amazing world of Godot!

# Sample Godot FPS Project
Sample FPS project for Unity Refugees who are starting to use Godot.


## What does this project cover?

This project covers the most basic ideas of understanding how to use godot for game projects. The project is an FPS because that's what I believe most people who think Godot "Can't handle" advanced game ideas are trying to make. In no way does this project means to undermine or talk down developers' knowledge, the only reason for this project to exist is to help improve the community and hopefully get more people to use Godot for their own projects.

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



## Playtest Area.tscn

### Scene Hierarchy

In this scene I have made multiple nodes of the Node type for organizing multiple elements on the scene. The reason for that is that Node is really cheap and wouldn't hurt the rendering of the game too much just for organizing the level. I've separated the scene into the following categories:

  - Environment
    - Meshes: All of the mesh objects in the scene are children of this node.
    - Lights: All lights in the scene are children of this node.
    - Collision Objects: All collision objects present in the scene are children of this node.
    - Enemy Spawn Points: All nodes used for marking down enemy spawn points in the scene are children of this node.
  - Entities: All game entities (Player, enemies, etc.) are children of this node.

I've also added a timer named **"Enemy Spawn Timer"** to be used for handling timed enemy spawns in the scene.

### Scene Script

#### _ready()

We just call the *randomize()* function so that every RNG this script does will be different based on runtime. After that, we also connect the *timeout* signal in the *Enemy Spawn Timer* node to the *Spawn Enemy()* function, so that it will be called every time the timer "times out".

#### SpawnEnemy()
 
We get the possible spawn points (All children of the *Enemy Spawn Points* node in the scene), a reference to the Player (so we can find out its position later), an Instance of the Enemy Scene file and create an empty array for storing possible spawn positions. Then, for each spawn point we check if it's distance to the player is greater than 10 and, if so, add its position to the *PossibleSpawns* array. After choosing a random position out of all of the *PossibleSpawns* we add the enemy instance to the scene as a child of the *Entities* node.

## Player.tscn

### Scene Hierarchy

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

### Scene Script

asdasd

## Enemy.tscn

### Scene Hierarchy

asdasd

### Scene Script

asdasd

## Shot Particle.tscn

### Scene Hierarchy

asdasd

### Scene Script

asdasd

## Enemy Health Bar.tscn

### Scene Hierarchy

asdasd

### Scene Script

asdasd

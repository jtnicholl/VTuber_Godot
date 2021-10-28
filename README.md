# VTuber_Godot
VTuber_Godot is a Godot-based, free and open source, from-scratch reimplementation of the Unity project used by [VTuber_Unity](https://github.com/kwea123/VTuber_Unity).

This application does not track your face on its own, it recieves tracking data over TCP from VTuber_Unity's Python script.

I originally created this with the intention of gradually adding on to it and creating a full-featured application. However, since then, [OpenSeeFace GD](https://github.com/you-win/openseeface-gd) was created, which is making fast progress and uses a better tracker. If you are looking for an open source VTubing application, I would reccomend you head there.

Since this will not be updated further, it has been archived.

# Usage
This is used the exact same way. Follow the instructions for VTuber_Unity and simply swap out the Unity application for this Godot project. Godot 3.2 is required to run.

## Customizing
Creating your own avatar is straightforward.

Create a character that extends `Avatar`, overriding the `set_values` method. Have this method pose the character.

Then add your character to a stage. You can extend the `Stage3D` scene, or if you'd rather you can create a scene from scratch with the `Stage` script attached. `Stage` has an exported property for a path to an `Avatar`, so point this to your character. Set the default scene in the project settings to your new stage, and you are done.

Note that your character can be in 2D. I have not included an example of a 2D character, but there is no reason you couldn't create one.

# Notes
The example avatar does not have any animations for the face. This is simply because the model I used didn't come with any, and I didn't bother to add them since it's just for an example. You will probably want some for your own character.

# Credits
The character model is from Sketchfab user quirkysketchman, released under Creative Commons Attribution. [Source](https://sketchfab.com/3d-models/godette-chan-5e5dd8978e21431f992dee953c11558d)

# License
This project is released under version 3 of the GPL. See the [license](LICENSE) file for details.

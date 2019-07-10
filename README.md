# GeoCheck
As I thought it would be fun to make things a bit differently, I implemented this small exercise using the [Pharo](https://pharo.org) plateform.
Pharo is a modern Smalltalk implementation that really let developpers enjoy a fully live coding experience.
For the purpose of the exercise, I am fully aware it might be a bit over engineered, but really it was really a good time to develop it, and I hope you'll have a good time reviewing it.

## Packages overview
GeoCheck is composed of 3 packages:
- BaselineOfGeoCheck: it is the package that define the only dependency of the project ([PetitParser](https://github.com/moosetechnology/PetitParser) a parsing engine)
- GeoCheck: the proper code of the app 
   - one file per class.
   - one file per extension.
   
     An extension is a set of methods to be added to classes that already exist in the system --- eg: the method `deg` in the `Number` class that return an instance of Angle, so we can right `12 deg` and this is an isntance of Angle of 12 degree.
- GeoCheck-Tests: well, you get it, it is all the tests.

# Install
First of all you will need the Pharo Virutal Machine, please get the one adapted to your system here:
https://files.pharo.org/get-files/70/.
Then you can download a fully ready image at: 
https://github.com/mattonem/GeoCheck/releases/download/v1/geocheckRelease.zip

Now you can uncompress the image and the VM, and execute it like so:

```
/path/toTheVm/pharo --headless /path/toTheImage/geocheckRelease.image geoCheck --file="path/to/customers.txt" --target="53.339428 deg @ -6.257664 deg" --radius="100"

# target/radius options are optional, default will be Dublin with radius 100km 
```

output:

```
This VM uses a separate heartbeat thread to update its internal clock
and handle events.  For best operation, this thread should run at a
higher priority, however the VM was unable to change the priority.  The
effect is that heavily loaded systems may experience some latency
issues.  If this occurs, please create the appropriate configuration
file in /etc/security/limits.d/ as shown below:

cat <<END | sudo tee /etc/security/limits.d/pharo.conf
*      hard    rtprio  2
*      soft    rtprio  2
END

and report to the pharo mailing list whether this improves behaviour.

You will need to log out and log back in for the limits to take effect.
For more information please see
https://github.com/OpenSmalltalk/opensmalltalk-vm/releases/tag/r3732#linux
======================================
Client ids within 100 km of location -6.257664°  53.339428° are:
12 8 26 6 4 5 11 31 13 15 17 39 24 29 30 23
======================================
```

# Install from source code (using Pharo-launcher)
In order to load the source code in a brand new image, I would recommend you first install [Pharo-launcher](http://pharo.org/web/download).

This app let's handle, all Pharo projects.
![launcher](/launcher.PNG)
To start a new project, just double click `Pharo7.0-64bits (Stable)`.
Your new project will appear in the right panel.
Now run the project (double click).
From here we will load the code. First open a playground, to execute some piece of code --- go to Tools -> Playground.
![launcher](/playground.PNG)
In the playground, copy:
```
Metacello new
   baseline: 'GeoCheck';
   repository: 'github://mattonem/GeoCheck/';
   load.
Smalltalk saveSession
```
And press the play button on the top right coner.
After a couple of second, the image is ready. You can quit and run it via command line.
The image should be located in the your `USERFOLDER/Pharo/images/<name of the image>/`.
You can find the vm that pharo-launcher installed in `USERFOLDER/Pharo/vm/`.

But you can also execute the app from with in the GUI and have a taste of what is Pharo --- Follow me the next section.
## Going futher
Let's some fun and execute the application step by step (the best way to asses the architecture of a piece of code). 

To do so, clear your playground and execute something like this:
```
PPGeoCheckParser2Model parse: ('path/to/a/data/file.txt') asFileReference contents.
```
and press the play button (or do Crtl + G). It will execute the parse on the content of the file and put the result in the right panel.
![parseFile](/parseFile.PNG)

The result is an array of user nicely parsed.
Going the to `Raw` tab of the result, a text editor will appears at the bottom of the panel. From here you can execute code on the Array instance. So, lets select people close to Dublin by executing:
```
self select: [ :user | (user geoPosition earthDistanceTo: (53.339428 deg @ -6.257664 deg)) < 100  ] 
```
Press ctrl + G to execute. 
A new panel appears with only users within 100km from Dublin.
If you only want Ids you can execute
```
self collect: #userId
```


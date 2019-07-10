# GeoCheck
As I thought it would be fun to make things a bit differently, I implemented this small exercise using the [Pharo](https://pharo.org) plateform.
Pharo is a modern Smalltalk implementation that really let developpers enjoy a fully live coding experience.
For the purpose of the exercise, I am fully aware it might be a bit over engineered, but really it is a good experience.

## Packages overview
GeoCheck is composed of 3 packages:
- BaselineOfGeoCheck: it is the package that define the only dependency of the project ([PetitParser](https://github.com/moosetechnology/PetitParser) a parsing engine)
- GeoCheck: the proper code of the app
- GeoCheck-Tests: well, you get it, it is all the tests.

# Install
First of all you will need the Pharo Virutal Machine, please get the one adapted to your system here:
https://files.pharo.org/get-files/70/.
Then you can download a fully ready image at: 
https://github.com/mattonem/GeoCheck/releases/download/v1/geocheckRelease.zip

Now you can uncompress the image, and execute it like so:

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
```


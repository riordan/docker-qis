docker-qis
==========
# Note: This no longer works
At present, Instagram is not making their previous search API open without significant review for partners. Therefore, unless you've somehow got one of those reviewed API keys, this simply won't work.

# Background

Docker container for running Propublica's [QIS](https://github.com/propublica/qis): Quick Instagram Search. QIS lets you search by geofence.

QIS requires an [Instagram API Key](https://instagram.com/developer), with "public_content" permissions scope, which is increasingly challenging for analysis applications. Therefore, this exists as an example to show how to run QIS, but has not been put into practice. I wish it were different too.

Instagram now allows users to [Explore by Location](https://www.instagram.com/explore/locations/) which may mitigate some of the need for this tool. This can be done by a drill-down on [Instagram's Explore](https://www.instagram.com/explore/locations/), or by finding the [Facebook Places ID search](https://developers.facebook.com/tools/explorer/145634995501895/?method=GET&path=...%3Ffields%3D%257Bfieldname_of_type_Location%257D&version=v2.8) and plugging its ID into the URL structure: `https://www.instagram.com/explore/locations/{placeID}`.

# Instructions:
_This is derived from the instructions for [QIS](https://github.com/propublica/qis) and is accurate as of 2017-02-14_

**Requirements**
* [Docker](https://docker.io)
* A sense for disappointment that the thing you wanted to do is now harder to do and likely not going to happen.

**Register an Instagram API Key**
* Create an [Instagram API key](https://instagram.com/developers) using a valid Instagram account.
* Submit a full application to request access to `public_content`. You will not be able to search Instagram without this, sadly.
* Record the API key's `Client ID` & `Client Secret`. These identify your application as yours to Instagram.
* Set the Callback URL to whatever the site will be hosted at. By default this is `http://localhost:4567`. This may not pass muster with the public content review.

**Configure the build**
* Copy or move `keys.example.yml` to `keys.yml`. This is where you'll tell QIS where it's being hosted & its instagram keys.
* In `keys.yml` copy your `instagram_client_id: ` & `instagram_secret:` to the right place. If you're hosting the site at anywhere other than `http://localhost:4567`, change the `root_uri:`. Delete the Google keys, leaving their values blank (unless you really want to register them).

**Build & run**
* Have Docker build the application. Inside this directory, from your command line run: `docker build -t qis .`
* Once this completes, run the application: `docker run -p 4567:4567 qis:latest`
* Visit the site in your browser: [http://localhost:4567](http://localhost:4567)
* Be disappointed that your API key doesn't let you search public things any more.

To stop the application, press `ctrl+c` in your terminal to kill the docker container.


# Questions / Comments
Open an issue on this repository.

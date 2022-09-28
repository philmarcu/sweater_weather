# Sweater Weather

## Table of Contents
1. [Learning Goals](#learning-goals)
2. [Setup](#setup)
3. [API](#api)
4. [Resources](#resources)

Things you may want to cover:

## Learning Goals

The goal of this project was to learn how to effectively use different API endpoints from other websites and combine them with others to display relevant information to the user depending on their needs. This project utilizes the OpenWeather One Call API and the MapQuest Geocoding + Directions API in order to get weather & route information about a user's chosen location.

The architecture of the project is based around the usage of the jsonapi-serializer gem to turn Ruby objects into JSON objects that can be passed to a front-end application and displayed in whatever fashion they choose.

In this application the backend creates a Ruby object with attributes that have information given to it from the previously mentioned APIs.
The Ruby object looks likes so:

`#<Roadtrip:0x000000011429b5c0
 @duration="01:22:19",
 @end_city="Estes Park, CO",
 @id=nil,
 @lat=40.376129,
 @long=-105.523651,
 @start_city="Denver, CO",
 @travel_time="1 hours, 22 minutes",
 @weather_at_eta=#<RoadtripForecast:0x00000001141d8548 @conditions="few clouds", @temperature=50.11>>`
 
 We take that ruby object, re-format certain info and serialize it. The JSON Object is sent out looking like this:
 
 `{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver, CO",
            "end_city": "Estes Park, CO",
            "travel_time": "1 hours, 22 minutes",
            "weather_at_eta": {
                "temperature": 51.62,
                "conditions": "few clouds"
            }
        }
    }
}`

## Setup 

In order to try out the application you'll need to clone this repository and create your own API keys from OpenWeather & MapQuest. I'll go further into how to create those keys in the API section. For the set up you should copy this SSH key: `git@github.com:philmarcu/sweater_weather.git`

After you copy the key run `git clone *ssh key*` into the desired folder you want this application to be stored under. Run `bundle`, then `bundle update` to receive all the gems currently used in the project. Run 'rails db:create' to create a new database inside your application. After that run 'bundle exec figaro install' to create an application.yml file inside of your app so that you can store the API keys inside of there.

## API

[OpenWeather API](https://openweathermap.org/api, "OpenWeather API") - they have numerous kinds of APIs, this project only utilized the One Call API.

[MapQuest Geocoding API](https://developer.mapquest.com/documentation/geocoding-api/, "MapQuest Geocoding")

[MapQuest Directions API](https://developer.mapquest.com/documentation/directions-api/, "MapQuest Directions")

Take note of how those API keys call their keys inside of their API urls - the API key you create when you sign up with them must be stored in their specific variable name for the api key( OpenWeathers is called 'appid', MapQuests is called 'key')

## Resources

This project heavily used the gems [Faraday](https://lostisland.github.io/faraday/) and [JSON-API Serializer](https://github.com/jsonapi-serializer/jsonapi-serializer) in order to manipulate the needed URIs & data to transfer information over from the previously mentioned APIs.

mongoose = require "mongoose"
server = require "../server"
events = require "./events"
connectionDefault = server.connectionDefault
Schema = mongoose.Schema

EventLinkDef =
  "eventType":  type: String, enum: events.eventTypes
  "eventName":  String
  "display":    String

MediatorLinkDef =
  'mediator':   String # mediator URN
  'name':       String
  'display':    String

VisualizerSchema = new Schema
  "name":                   type: String, required: true, unique: true
  "components":             [EventLinkDef]
  "channels":               [EventLinkDef]
  "mediators":              [MediatorLinkDef]
  "color":
    "inactive":             type: String, default: "#cccccc"
    "active":               type: String, default: "#4cae4c"
    "error":                type: String, default: "#d43f3a"
    "text":                 type: String, default: "#000000"
  "size":
    "responsive":           type: Boolean, default: true
    "width":                type: Number, default: 1000
    "height":               type: Number, default: 400
    "padding":              type: Number, default: 20
  "time":
    "updatePeriod":         type: Number, default: 200
    "minDisplayPeriod":     type: Number, default: 500
    "maxSpeed":             type: Number, default: 5
    "maxTimeout":           type: Number, default: 5000

# Compile schema into Model
exports.Visualizer = connectionDefault.model 'Visualizer', VisualizerSchema

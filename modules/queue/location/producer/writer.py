import grpc
import location_event_pb2
import location_event_pb2_grpc

"""
Sample implementation of a writer that can be used to write messages to gRPC.
"""

print("Sending sample payload...")

channel = grpc.insecure_channel("localhost:30004")
stub = location_event_pb2_grpc.location_eventServiceStub(channel)

# Update this with desired payload
locationEvent = location_event_pb2.LocationEventMessage(
    userId=1,
    latitude=2,
    longitude=199
)


response = stub.Create(locationEvent)
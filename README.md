# map


### UILongPressRecognizer define. target invokes action

```swift
let uiLongPressGestureReconizer = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress(gesture:)))
```

### UILongPressRecognizer add mapview

```swift
map.addGestureRecognizer(uiLongPressGestureReconizer)
```


### UILongPressRecognizer Trigger action. first get touchLocation and convert Coordinate, then define annonation
```swift
func longPress(gesture: UILongPressGestureRecognizer){
        
        let touchPoint = gesture.location(in: self.map)
        
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coordinate
        
        annotation.title = "new Place"
        annotation.subtitle = "maybe i go there too"
        
        map.addAnnotation(annotation)
    }
```

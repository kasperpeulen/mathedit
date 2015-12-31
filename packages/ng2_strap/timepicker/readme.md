### Usage
```typescript
import {Timepicker} from 'ng2-bootstrap';
```

### Annotations
```typescript
// class Timepicker implements OnInit
@Component({
  selector: 'timepicker[ngModel]',
  properties: [
    'hourStep', 'minuteStep',
    'meridians', 'showMeridian',
    'readonlyInput',
    'mousewheel', 'arrowkeys',
    'showSpinners',
    'min', 'max'
  ],
})
```

### Timepicker properties
  - `vertical` (`?boolean=false`) - if `true` tabs will be placed vertically
  - `justified` (`?boolean=false`) - if `true` tabs fill the container and have a consistent width
  - `type` (`?string='tabs'`) - navigation context class: 'tabs' or 'pills'

  - `ngModel` (`*Date`) - binds to Date object
  - `hour-step` (`?number=1`) - hours change step
  - `minute-step` (`?number=1`) - minutes change step
  - `meridians` (`?Array<string> = ['AM', 'PM'];`) - meridian labels based on locale (*will be based later*)
  - `show-meridian` (`?boolean=true`) - if `true` works in 12H mode and displays AM/PM. If `false` works in 24H mode and hides AM/PM
  - `readonly-input` (`?boolean=false`) - if `true` hours and minutes fields will be readonly
  - `mousewheel` (`?boolean=true`) - if `true` scroll inside hours and minutes inputs will change time
  - `arrowkeys` (`?boolean=true`) - if `true` up/down arrowkeys inside hours and minutes inputs will change time
  - `show-spinners` (`?boolean=true`) - if `true` spinner arrows above and below the inputs will be shown
  - `min` (`?Date:undefined`) - minimum time user can select
  - `max` (`?Date:undefined`) - maximum time user can select

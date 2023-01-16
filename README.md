## Reservation API

## Endpoints

```
POST /api/v1/reservations
PATCH /api/v1/reservations/:id
```

## Reservation Object

```
{
  "id":1,
  "guest_id":1,
  "start_date":"2021-03-12",
  "end_date":"2021-03-16",
  "nights":4,
  "guests":4,
  "adults":null,
  "children":null,
  "infants":0,
  "status":"accepted",
  "currency":"AUD",
  "payout_price":"3800.0",
  "security_price":"500.0",
  "total_price":"4300.0",
  "code":"123891",
  "created_at":"2023-01-16T08:47:01.074Z",
  "updated_at":"2023-01-16T08:47:01.074Z",
  "source":"booking"
}
```

## Development
Run `bin/setup` to setup development

## Tests
Run `bin/tests` to run test suite

# Prescription System Backend

This is a Ruby on Rails API-only application using PostgreSQL.

## Versions

1. Ruby 3.4.0
2. Rails 8.0.1
3. PostgreSQL 17

## Setup

1. Clone the repository:

   ```sh
   git clone https://github.com/Skipper-116/prescription-backend.git
   cd prescription-backend
   ```

2. Install the required gems:

   ```sh
   bundle install
   ```

3. Copy the example database configuration file and update it with your local PostgreSQL credentials:

   ```sh
   cp config/database.yml.example config/database.yml
   ```

4. Set up the database:

   ```sh
   rails db:create
   rails db:migrate
   rails db:seed
   ```

   or

   ```sh
   rails db:setup
   ```

5. Start the Rails server:
   ```sh
   rails server
   ```

## Endpoints

- List of available endpoints will be documented here.

#### Prescription Dosages

- `GET /api/v1/prescription_dosages`
- `POST /api/v1/prescription_dosages`
- `GET /api/v1/prescription_dosages/:id`
- `PATCH /api/v1/prescription_dosages/:id`
- `DELETE /api/v1/prescription_dosages/:id`

#### Prescriptions

- `GET /api/v1/prescriptions`
- `POST /api/v1/prescriptions`
- `GET /api/v1/prescriptions/:id`
- `PATCH /api/v1/prescriptions/:id`
- `DELETE /api/v1/prescriptions/:id`

#### Dosages

- `GET /api/v1/dosages`
- `POST /api/v1/dosages`
- `GET /api/v1/dosages/:id`
- `PATCH /api/v1/dosages/:id`
- `DELETE /api/v1/dosages/:id`

#### Medications

- `GET /api/v1/medications`
- `POST /api/v1/medications`
- `GET /api/v1/medications/:id`
- `PATCH /api/v1/medications/:id`
- `DELETE /api/v1/medications/:id`

#### Frequency Types

- `GET /api/v1/frequency_types`
- `POST /api/v1/frequency_types`
- `GET /api/v1/frequency_types/:id`
- `PATCH /api/v1/frequency_types/:id`
- `DELETE /api/v1/frequency_types/:id`

## Running Tests

To run the test suite, use the following command:

```sh
bundle exec rspec
```

## Contributing

- Fork the repository.
- Create a new feature branch.
- Commit your changes.
- Push to the branch.
- Create a new Pull Request.

## License

This project is licensed under the MIT License.

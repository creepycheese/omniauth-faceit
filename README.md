# OmniAuth FACEIT

This gem is an OmniAuth 2.0 strategy, supporting the FACEIT provider.

## Usage

Add to your `Gemfile`:

```ruby
gem 'omniauth-faceit'
```

And then integrate the strategy into your middleware:

```ruby
use OmniAuth::Builder do
  provider :face_it, "my-face-it-oauth-id", "my-face-it-oauth-secret"
end
```

If you are using Rails, you may want to add it to the middleware stack:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :face_it, ENV['FACE_IT_APP_ID'], ENV['FACE_IT_SECRET']
end
```

Instructions on how to set oAuth2 protocol to link FACEIT can be found on [this page](https://developers.faceit.com/docs/auth/oauth2).


For additional information, please refer to the [OmniAuth wiki](https://github.com/intridea/omniauth/wiki).

## Authentication Hash

Here's an example of the *Authentication Hash* available in `request.env['omniauth.auth']`

```ruby
{
  "credentials" => {
    "expires" => true,
    "expires_at" => 1560425337,
    "refresh_token" => "ffcde420-de56-46dd-9944-37c06b0772f9",
    "token" => "6651de74-8146-466a-8ab7-72c783e38c34"
  },
  "extra" => {},
  "info" => {
    "email" => "inqify@gmail.com",
    "uid" => {
      "aud" => "10e6f1bb-a419-4f7c-a6b5-cf59c0c2cf2a",
      "birthdate" => "21/06/1993",
      "email" => "inqify@gmail.com",
      "email_verified" => false,
      "family_name" => "Burdaev",
      "given_name" => "Evgeniy",
      "guid" => "8c1f968b-4f45-4c1e-b932-754e793dba86",
      "iss" => "https://api.faceit.com/auth",
      "locale" => "ru",
      "membership" => "free",
      "memberships" => [
        "free"
      ],
      "nickname" => "inqify",
      "picture" => "https://cdn.faceit.com/oauth/icons/default.jpg"
    }
  },
  "provider" => :face_it,
  "uid" => nil
}
```

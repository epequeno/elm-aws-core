module AWS.Core.Credentials exposing
    ( Credentials, AccessKeyId, SecretAccessKey, SessionToken
    , fromAccessKeys, setSessionToken
    , getAccessKeyId, getSecretAccessKey, getSessionToken
    )

{-| AWS credentials.


# Types

@docs Credentials, AccessKeyId, SecretAccessKey, SessionToken


# Building

@docs fromAccessKeys, setSessionToken


# Accessing

@docs accessKeyId, secretAccessKey, sessionToken

-}

-- CREDENTIALS


{-| Holds AWS credentials.
-}
type Credentials
    = Credentials
        { accessKeyId : String
        , secretAccessKey : String
        , sessionToken : Maybe String
        }


{-| The AWS access key ID.
-}
type alias AccessKeyId =
    String


{-| The AWS secret access key.
-}
type alias SecretAccessKey =
    String


{-| An optional AWS session token.
-}
type alias SessionToken =
    String


{-| Create AWS credentials given an access key and secret key.
-}
fromAccessKeys : AccessKeyId -> SecretAccessKey -> Credentials
fromAccessKeys accessKeyId secretAccessKey =
    Credentials
        { accessKeyId = accessKeyId
        , secretAccessKey = secretAccessKey
        , sessionToken = Nothing
        }


{-| Set the session token.
-}
setSessionToken : SessionToken -> Credentials -> Credentials
setSessionToken token (Credentials creds) =
    Credentials { creds | sessionToken = Just token }


{-| Gets the access key.
-}
getAccessKeyId : Credentials -> AccessKeyId
getAccessKeyId (Credentials { accessKeyId }) =
    accessKeyId


{-| Gets the secret.
-}
getSecretAccessKey : Credentials -> SecretAccessKey
getSecretAccessKey (Credentials { secretAccessKey }) =
    secretAccessKey


{-| Gets the session token.
-}
getSessionToken : Credentials -> Maybe SessionToken
getSessionToken (Credentials { sessionToken }) =
    sessionToken

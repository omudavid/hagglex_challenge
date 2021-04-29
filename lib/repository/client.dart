import 'package:gql_http_link/gql_http_link.dart';
import 'package:graphql/client.dart';
import 'package:hagglex/repository/model/log_in_response.dart';

class GraphqlClient {
  GraphQLClient client;

  GraphqlClient() {
    setUpClient();
  }

  // GraphQLClient getGithubGraphQLClient() {
  //   final Link _link = HttpLink(
  //     'https://hagglex-backend-staging.herokuapp.com/graphql',
  //   );
  //
  //   return GraphQLClient(
  //     cache: GraphQLCache(),
  //     link: _link,
  //   );
  // }
  Future<void> setUpClient() async {
    final Link _link = HttpLink(
      'https://hagglex-backend-staging.herokuapp.com/graphql',
    );

    client = GraphQLClient(
      cache: GraphQLCache(),
      link: _link,
    );
  }

  Future<QueryResult> logIn(String username, String password) async {
    final QueryOptions options = QueryOptions(
      document: gql(
        r'''
        mutation logIn($username: String!, $password: String!) {
         login(data:{input:$username, password:$password}){
         
         user{_id, email, role{role,description}},token,twoFactorAuth  
   }
  
        }
      ''',
      ),
      variables: <String, dynamic>{'username': username, 'password': password},
    );

    final QueryResult result = await client.query(options);

    return result;
  }

  Future<QueryResult> signUp(
    String email,
    String password,
    String username,
    String phoneNumber,
  ) async {
    final QueryOptions options = QueryOptions(
      document: gql(
        r'''
        mutation signUp($email: String!, $password: String!, $username: String!, $phoneNumber: String!) {
      register(
    data:{
      email:$email,
      username:$username,
      password:$password,
      phonenumber:$phoneNumber,
      country:"Nigeria",
      currency:"NGN"
    }){
      user{_id,username,phonenumber,email}
      token
  }
  
        }
      ''',
      ),
      variables: <String, dynamic>{
        'email': email,
        'password': password,
        'username': username,
        'phoneNumber': phoneNumber,
      },
    );

    final QueryResult result = await client.query(options);
    if (result.hasException) {
      print(result.exception.toString());
    }

    final repositories = result.data;

    print(repositories);

    return result;
  }

  Future<QueryResult> resendVerification(
    String email,
  ) async {
    final QueryOptions options = QueryOptions(
      document: gql(
        r'''
        query resendVerification($email: String!) {
      resendVerificationCode(data:{email: $email})
  
        }
      ''',
      ),
      variables: <String, dynamic>{
        'email': email,
      },
    );

    final QueryResult result = await client.query(options);
    if (result.hasException) {
      print(result.exception.toString());
    }

    final repositories = result.data;

    print(repositories);

    return result;
  }

  Future<QueryResult> verifyAccount(
    int code,
  ) async {
    final QueryOptions options = QueryOptions(
      document: gql(
        r'''
        mutation verifyAccount($code: Int!) {
          verifyUser(data:{$code:552264}){
            user{_id,username,email,phonenumber,referralCode,kycStatus},
              token
            }
        }
      ''',
      ),
      variables: <String, dynamic>{
        'code': code,
      },
    );

    final QueryResult result = await client.query(options);
    if (result.hasException) {
      print(result.exception.toString());
    }

    final repositories = result.data;

    print(repositories);

    return result;
  }
}

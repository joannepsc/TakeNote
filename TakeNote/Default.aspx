<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TakeNote.Default" %>

<!DOCTYPE html>

<html ng-app="phonecat">
<head runat="server">
    <title ng-bind-template="Google Phone Gallery: {{query}}">Google Phone Gallery</title>
    <link rel="stylesheet" type="text/css" href="css/app.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <script type="text/javascript" src="scripts/angular.min.js"></script>
</head>
<body ng-controller="PhoneListCtrl">

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span2">
                <!--Sidebar content-->
                <select ng-model="orderProp">
                    <option value="name">Alphabetical</option>
                    <option value="age">Newest</option>
                </select>
                Search:
                <input ng-model="query">
            </div>
            <div class="span10">
                <!--Body content-->
                Hello
                <ul class="phones">
                    <li ng-repeat="phone in phones | filter:query | orderBy: orderProp">{{phone.name}}
            <p>{{phone.snippet}}</p>
                    </li>
                </ul>

            </div>
        </div>
    </div>



    <script type="text/javascript">

        angular.module('phonecat', []).
          config(['$routeProvider', function ($routeProvider) {
              $routeProvider.
                  when('/phones', { templateUrl: 'partials/phone-list.html', controller: PhoneListCtrl }).
                  when('/phones/:phoneId', { templateUrl: 'partials/phone-detail.html', controller: PhoneDetailCtrl }).
                  otherwise({ redirectTo: '/phones' });
          }]);

        function PhoneListCtrl($scope, $http) {
            $http.get('phones/phones.html').success(function (data) {
                $scope.phones = data;
            });

            $scope.orderProp = 'age';
        }

        function PhoneDetailCtrl($scope, $routeParams) {
            $scope.phoneId = $routeParams.phoneId;
        }

    </script>
</body>
</html>

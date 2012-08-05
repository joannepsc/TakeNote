<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TakeNote.Default" %>

<!DOCTYPE html>

<html ng-app>
<head runat="server">
    <title ng-bind-template="Google Phone Gallery: {{query}}">Google Phone Gallery</title>
    <link rel="stylesheet" type="text/css" href="css/app.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <script type="text/javascript" src="scripts/angular.min.js"></script>
</head>
<body ng-controller="PhoneListCtrl">
    <select ng-model="orderProp">
        <option value="name">Alphabetical</option>
        <option value="age">Newest</option>
    </select>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span2">
                <!--Sidebar content-->

                Search:
                <input ng-model="query">
            </div>
            <div class="span10">
                <!--Body content-->

                <ul class="phones">
                    <li ng-repeat="phone in phones | filter:query | orderBy: orderProp">{{phone.name}}
            <p>{{phone.snippet}}</p>
                    </li>
                </ul>

            </div>
        </div>
    </div>



    <script type="text/javascript">

        function PhoneListCtrl($scope) {
            $scope.phones = [
                {
                    "name": "Nexus S",
                    "snippet": "Fast just got faster with Nexus S.",
                    "age": 0
                },
                {
                    "name": "Motorola XOOMâ„¢ with Wi-Fi",
                    "snippet": "The Next, Next Generation tablet.",
                    "age": 1
                },
                {
                    "name": "MOTOROLA XOOMâ„¢",
                    "snippet": "The Next, Next Generation tablet.",
                    "age": 2
                }
            ];

            $scope.orderProp = 'age';
        }
    </script>
</body>
</html>

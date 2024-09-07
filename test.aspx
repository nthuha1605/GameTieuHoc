<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        * {
            outline: 0;
            font-family: sans-serif
        }

        body {
            background-color: #fafafa
        }

        span.msg,
        span.choose {
            color: #555;
            padding: 5px 0 10px;
            display: inherit
        }

        .container {
            width: 500px;
            margin: 50px auto 0;
            text-align: center
        }

        /*Styling Selectbox*/
        .dropdown {
            width: 300px;
            display: inline-block;
            background-color: #fff;
            border-radius: 2px;
            box-shadow: 0 0 2px rgb(204, 204, 204);
            transition: all .5s ease;
            position: relative;
            font-size: 14px;
            color: #474747;
            height: 100%;
            text-align: left
        }

            .dropdown .select {
                cursor: pointer;
                display: block;
                padding: 10px
            }

                .dropdown .select > i {
                    font-size: 13px;
                    color: #888;
                    cursor: pointer;
                    transition: all .3s ease-in-out;
                    float: right;
                    line-height: 20px
                }

            .dropdown:hover {
                box-shadow: 0 0 4px rgb(204, 204, 204)
            }

            .dropdown:active {
                background-color: #f8f8f8
            }

            .dropdown.active:hover,
            .dropdown.active {
                box-shadow: 0 0 4px rgb(204, 204, 204);
                border-radius: 2px 2px 0 0;
                background-color: #f8f8f8
            }

                .dropdown.active .select > i {
                    transform: rotate(-90deg)
                }

            .dropdown .dropdown-menu {
                position: absolute;
                background-color: #fff;
                width: 100%;
                left: 0;
                margin-top: 1px;
                box-shadow: 0 1px 2px rgb(204, 204, 204);
                border-radius: 0 1px 2px 2px;
                overflow: hidden;
                display: none;
                max-height: 144px;
                overflow-y: auto;
                z-index: 9
            }

                .dropdown .dropdown-menu li {
                    padding: 10px;
                    transition: all .2s ease-in-out;
                    cursor: pointer
                }

            .dropdown .dropdown-menu {
                padding: 0;
                list-style: none
            }

                .dropdown .dropdown-menu li:hover {
                    background-color: #f2f2f2
                }

                .dropdown .dropdown-menu li:active {
                    background-color: #e2e2e2
                }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            

            <div class="dropdown">
                <div class="select">
                    <span>?</span>
                   
                </div>
                <input type="hidden" name="gender" />
                <ul class="dropdown-menu">
                   
                    <li id="male">Male</li>
                    <li id="female">Female</li>
                </ul>
            </div>

            <span class="msg"></span>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>    
        /*Dropdown Menu*/
        $('.dropdown').click(function () {
            $(this).attr('tabindex', 1).focus();
            $(this).toggleClass('active');
            $(this).find('.dropdown-menu').slideToggle(300);
        });
        $('.dropdown').focusout(function () {
            $(this).removeClass('active');
            $(this).find('.dropdown-menu').slideUp(300);
        });
        $('.dropdown .dropdown-menu li').click(function () {
            $(this).parents('.dropdown').find('span').text($(this).text());
            $(this).parents('.dropdown').find('input').attr('value', $(this).attr('id'));
        });
        /*End Dropdown Menu*/


        $('.dropdown-menu li').click(function () {
            var input = '<strong>' + $(this).parents('.dropdown').find('input').val() + '</strong>',
                msg = '<span class="msg">Hidden input value: ';
            $('.msg').html(msg + input + '</span>');
        });
    </script>
</body>

</html>

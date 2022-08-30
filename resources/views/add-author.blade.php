<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-COMPATIBLE" content="ie=edge">
        <title>Author List</title>
        <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

</head>
<body>
    <div class="container" style="margin-top:20px ;">
        <div class="row">
            <div class="col-md-12">
                <h2>Add New Author</h2>
                @if (Session::has('success'))
                <div class="alert alert-success" role="alert">
                    {{Session::get('success')}}
                </div>
                @endif
        <form action="{{url('save')}}" methods="GET">
            @csrf
            <div class="md-3">
                <label for="id" class="form-label">Author ID</label>
                <input type="text" name="bookauthorID" class="form-control"
                            placeholder="Enter Author ID">
            </div>
            <div class="md-3">
                <label for="name" class="form-label">Author Name</label>
                <input type="text" name="bookauthorname" class="form-control"
                            placeholder="Enter Author Name">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
            <a href="{{url('admin-author')}}" class="btn btn-success">Back</a>
        </form>
            </div>
        </div>
    </div>
</body>
<html>
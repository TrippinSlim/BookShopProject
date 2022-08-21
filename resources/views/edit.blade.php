<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Edit</title>
  </head>
  <body>
    <div class="container" style="margin-top:20px">
        <div class="row">
            <div class="col-md-12">
                <h2>Edit Product</h2>
                @if (Session::has('success'))
                    <div class="alert alert-success" role="alert">
                        {{Session::get('success')}}
                    </div>
                @endif
                <form action="{{url('update')}}" method="POST">
                    @csrf
                    <div class="md-3">
                        <label for="id" class="form-label">Book ID</label>
                        <input type="text" name="bookID" class="form-control"
                                value="{{$data->bookID}}" readonly>
                    </div>  
        
                    <div class="md-3">
                        <label for="bookname" class="form-label">Name</label>
                        <input type="text" name="bookname" class="form-control"
                                    value="{{$data->bookname}}">
                    </div>   
        
                    <div class="md-3">
                        <label for="bookprice" class="form-label">Price</label>
                        <input type="text" name="bookprice" class="form-control"
                                    value="{{$data->bookprice}}">
                    </div>   
        
                    <div class="md-3">
                        <label for="bookdetails" class="form-label">Details</label>
                        <input type="text" name="bookdetails" class="form-control"
                                    value="{{$data->bookdetail}}">
                    </div>
        
                    <div class="md-3">
                        <label for="bookimage1" class="form-label">Image</label>
                        <input type="file" name="bookimage1" class="form-control"
                                    value="{{$data->bookimage}}">
                    </div>  
        
                    <div class="md-3">
                        <label for="bookauthor" class="form-label">Author</label>
                        <input type="text" name="bookauthor" class="form-control"
                                    value="{{$data->bookauthorID}}">
                    </div>    
        
                    <div class="md-3">
                        <label for="bookcategory" class="form-label">Category</label>
                        <input type="text" name="bookcategory" class="form-control"
                                    value="{{$data->bookcategoryID}}">
                    </div> 
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <a href="{{url('admin-product')}}" class="btn btn-success">Back</a>
                </form>
            </div>
        </div>
    </div>
  </body>
</html>
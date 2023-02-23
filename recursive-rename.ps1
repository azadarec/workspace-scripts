param(
    $dir = "C:\Temp\Test"
)


function RenameElementsInDirectory($directory) {
    $files = Get-ChildItem "$dir\$directory"
    
    for($i = 0; $i -lt $files.length; $i++) {
        $file_ending = $files[$i].ToString().split(".")[1]
        $file = $files[$i]
        Write-Output "$file renamed file$i.$file_ending"
        
        Rename-Item "$dir\$directory\$file" -NewName "file$i.$file_ending"

    }

}

# Check if input path is valid
$isDirectory = Test-Path $dir -PathType Container
if(!$isDirectory) {
    throw "Directory does not exist"
}


# iterate over children in path
$subdirs = Get-ChildItem $dir
foreach($element in $subdirs) {
    Write-Output $element
    RenameElementsInDirectory($element); 
}


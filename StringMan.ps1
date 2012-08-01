function Select-Head ([string]$text, [int]$index, [string]$pattern) {
    $input += $text
    return $input | where { $_ -is [string] } |% {
        if($pattern) {
            $index = $_.IndexOf($pattern) 
        }
        if($index -ge $_.length) {return $_}
        return $_.Substring(0, $index)
    }
}

function Select-Tail ([string]$text, [int]$index, [int]$last, [string]$pattern) {
    $input += $text
    return $input | where { $_ -is [string] } |% {
        if($pattern) {
            $index = $_.IndexOf($pattern) + $pattern.length
        }
        elseif($last) {
            $index = $_.length - $last
        }
        if($index -ge $_.length) {return}
        $_.Substring($index) 
    }
}
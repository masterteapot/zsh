# This function renames image files with their dimensions in the format of WxH_filename.jpg

function jk_add_pic_size(){

	for f in *.*; do

		if [[ $f =~ ^[a-zA-Z].+?[.][jpnegJEPNG]{3,4}$ ]]; then
		
			mv "$f" "$(identify -format '%wx%h_%f' "$f")"
		fi
	done
}

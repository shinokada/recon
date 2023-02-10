fn_png2jpg(){
    check_cmd convert

    # for each png in the input directory
    for img in $( find ${INPUTDIR} -type f -iname "*.png" );
    do
        convert "$img" -quality "${QUALITY}"% "${img%.*}".jpg

        if [ ${OUTPUTDIR} ];then
            bannerColor "Moving converted files to ${OUTPUTDIR} ... " "blue" "*"
            mkdir -p ${OUTPUTDIR} && mv ${img%.*}".jpg "${OUTPUTDIR}"
            bannerColor "Moved all the files to ${OUTPUTDIR}." "green" "*"
        fi
    done

    bannerColor 'Completed converting png files to jpg files.' "green" "*"


}
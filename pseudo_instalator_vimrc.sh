function main
{
    vimrc_akt=~/.vimrc
    vimrc_nowy=vimrc
    katalog_kopia=~/vimrc_kopie_zapasowe
    nazwa_kopii=vimrc_kopia_zapasowa
    vim_pdf=vim.pdf
    vim_pdf_lokalizacja=~/.vim.own

    if [ -e $vimrc_akt ]
    then
        diff $vimrc_akt $vimrc_nowy >/dev/null
        if [ $? = 0 ]
        then
            echo "obecny vimrc jest juz w najnowszej wersji"
            return 0
        elif [ -e $vimrc_akt ]
        then
            SzukanieKopiiZapasowej $vimrc_akt $katalog_kopia
            if [ $? = 0 ]
            then
                KopiaZapasowa $vimrc_akt $katalog_kopia $nazwa_kopii
            fi
        fi
    fi
    cp vimrc ~/.vimrc
    echo "vimrc zostal zaktualizowany"
    VimPdf $vim_pdf $vim_pdf_lokalizacja
}

function VimPdf()
{
    if [ ! -e $2 ]
    then
        #echo katalog nie istnieje
        mkdir $2
    fi
    if [ ! -e $2/$1 ]
    then
        #echo plik $2/$1 nie istnieje
        cp $1 $2
        echo skopiowano plik $1 $2
    fi
}


function KopiaZapasowa()
{
    if [ -e $1 ]
    then
        if [ ! -d $2 ]
        then
            mkdir $2
            cp $1 $2
        else
            for ((i=0; i<10; i++))
            do
                if [ ! -e $2"/"$3"0"$i ]
                then
                    cp  $1 $2"/"$3"0"$i
                    echo "stworzono kopie zapasowa:"
                    echo "$2"/"$3"0"$i"
                    return 0
                fi
            done
            for ((i=10; i<100; i++))
            do
                if [ ! -e $2"/"$3$i ]
                then
                    cp  $1 $2"/"$3$i
                    echo "stworzono kopie zapasowa:"
                    echo "$2"/"$3$i"
                    return 0
                fi
            done
        fi
    fi
}

function SzukanieKopiiZapasowej()
{
    if [ ! -d $2 ]
    then
        return 0
    else
        aktualny_katalog=$(pwd)
        cd $2
        for i in *
        do
            cd $aktualny_katalog
            diff $1 "$2/$i" >/dev/null
            if [ $? = 0 ]
            then
                echo "istnieje kopia zapasowa"
                echo "$2/$i"
                return 1
            fi
        done
    fi
    return 0
}

main

#!/bin/bash

CONTAINER_ALREADY_STARTED="$HOME/XTTS-RVC-UI/firstrun"
if [ ! -e "$CONTAINER_ALREADY_STARTED" ]; then
    sudo chown xttsrvc:xttsrvc ~/XTTS-RVC-UI
    sudo chmod 755 ~/XTTS-RVC-UI

    git clone https://github.com/Vali-98/XTTS-RVC-UI.git

    cd ~/XTTS-RVC-UI || exit

    python3 -m venv venv
    source venv/bin/activate

    pip install torch==2.1.0 torchaudio==2.1.0 --index-url https://download.pytorch.org/whl/cu118
    pip install -r requirements.txt

    cd ~ || exit

    touch "$CONTAINER_ALREADY_STARTED"
fi

cd ~/XTTS-RVC-UI || exit

source venv/bin/activate
python app.py
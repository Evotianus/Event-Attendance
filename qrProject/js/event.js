let items = document.querySelector(".items");

let eventList = [];

function showEvent(eventId, title, content) {
    localStorage.setItem("event_id", eventId);
    localStorage.setItem("title", title);
    localStorage.setItem("content", content);
}

async function getEvent() {
    axios.post('https://event-attendance.000webhostapp.com/api/get-event').then((response) => {
        // console.log(response);
        // console.log(response.data[0]['id']);

        console.log(response.data);
        eventList = response.data;
        
        // console.log(eventList);
        for (let i = 0; i < eventList.length; i++) {
            console.log(eventList[i]);
            items.innerHTML += `
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
            <div class="single-portfolio">
            <a href="project-single.html" onclick="showEvent('${eventList[i]['id']}', '${eventList[i]['title']}', '${eventList[i]['content']}')">
            <img src="${eventList[i]['image']}" alt="Image" class="img-fluid">
            <div class="contents">
            <h3>${eventList[i]['title']}</h3>
            <div class="cat">${eventList[i]['date']}</div>
            <p style="color: white;"><i class="fa-sharp fa-solid fa-location-dot"></i>&nbsp;${eventList[i]['location']}</p>
            </div>
            </a>
                </div>
            </div>
            `
        }
    }, (error) => {
        console.log(error);
    });
}

getEvent();

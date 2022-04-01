import { env } from './config';

let progress =  document.getElementById('progress');
let percentageBox = document.getElementById('percentage');
let status = document.getElementById('status');

let percentValue = parseInt(env["LOADING_PERCENTAGE"] || 0);
let percentage = `${percentValue > 100 ? 100 : percentValue}%`;
let statusText = env["LOADING_MESSAGE"] || "Here should be status text";

progress.style.width = percentage;
percentageBox.innerHTML = percentage;
status.innerHTML = statusText;
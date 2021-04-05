const gulp = require('gulp');
const bump = require('gulp-bump');
const git = require('gulp-git');

gulp.task('up-develop',  function () {
    return gulp.src(['../package.json'])
        .pipe(bump({type:'prerelease'}))
        .pipe(gulp.dest('../'))
})

gulp.task('up-patch', function () {
    return gulp.src(['../package.json'])
        .pipe(bump({type:'patch'}))
        .pipe(gulp.dest('../'))
})

gulp.task('up-minor', function () {
    return gulp.src(['../package.json'])
        .pipe(bump({type:'minor'}))
        .pipe(gulp.dest('../'))
})


gulp.task('up-major', function () {
    return gulp.src(['../package.json'])
        .pipe(bump({type:'major'}))
        .pipe(gulp.dest('../'))
})